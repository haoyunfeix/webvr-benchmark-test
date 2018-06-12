function log(str) {
    var logElement = document.getElementById('log');
    logElement.textContent += str + '\n';
}


var logElement = document.getElementById('log');

window.addEventListener('error', function(err) {
    log('');
    log(err.error.stack.replace(new RegExp(window.location.href, 'g'), '/'));
});

var canvas = document.getElementById('canvas');
var gl = canvas.getContext('webgl2');
var dbg;

if (gl) {
    log('webgl2 context created');

    dbg = gl.getExtension('WEBGL_debug_shaders');

    // once shader cache loaded
    var onShaderLoad = function(raw) {
        var shaders = raw.split('^SH^');

        log(shaders.length + ' shaders found');
        log('starting compilations');

        // in next frame to get logs appear
        requestAnimationFrame(function() {
            for(var i = 0; i < shaders.length; i++) {
                var shaderDefinition = getShaderCode(shaders[i]);
                var program = makeProgram(shaderDefinition, i);
            }
        });
    };

    var getShaderCode = function(raw) {
        var vsStart = raw.indexOf("^VS^");
        var psStart = raw.indexOf("^PS^");
        var atStart = raw.indexOf("^AT^");

        var entry = raw.substring(0, vsStart);

        var vsCode = raw.substring(vsStart + 4, psStart);
        var fsCode = raw.substring(psStart + 4, atStart);
        var attribsString = raw.substring(atStart + 4, raw.length);

        // to ensure shader is not cached by driver, browser, anyone
        // add constant which will be always changed
        vsCode = vsCode.replace('CONST_SHADER_RECACHE', Math.random());
        fsCode = fsCode.replace('CONST_SHADER_RECACHE', Math.random());

        var a1 = attribsString.split(",");
        var attributes = { };
        for(var j = 0; j < a1.length - 1; j += 2)
            attributes[a1[j]] = a1[j + 1];

        return {
            id: entry,
            attributes: attributes,
            vs: vsCode,
            fs: fsCode
        };
    };

    var pad = function(num) {
        var s = '000' + num;
        return s.substr(s.length - 3);
    }

    var makeProgram = function(definition, programNumber) {
        var info, location, i;

        // vertex shader compilation
        var vShader = gl.createShader(gl.VERTEX_SHADER);
        gl.shaderSource(vShader, definition.vs);
        gl.compileShader(vShader);

        if (! gl.getShaderParameter(vShader, gl.COMPILE_STATUS)) {
            var info = gl.getShaderInfoLog(vShader);
            log('couldn\'t compile vertex shader ' + definition.id);
            log(definition);
            log(info.toString());
            return null;
        }

        gl.finish();

        // fragment shader compilation
        var fShader = gl.createShader(gl.FRAGMENT_SHADER);
        gl.shaderSource(fShader, definition.fs);
        gl.compileShader(fShader);

        if (! gl.getShaderParameter(fShader, gl.COMPILE_STATUS)) {
            var info = gl.getShaderInfoLog(fShader);
            log(' ');
            log('couldn\'t compile fragment shader ' + definition.id);
            log(info.toString());
            return null;
        }

        gl.finish();

        // program
        var program = gl.createProgram();
        gl.attachShader(program, vShader);
        gl.attachShader(program, fShader);

        gl.linkProgram(program);

        if (! gl.getProgramParameter(program, gl.LINK_STATUS)) {
            var info = gl.getProgramInfoLog(program);
            log(' ');
            log('couldn\'t link program ' + definition.id);
            log(info.toString());
            return null;
        }

        // Dump the shader sources
        var basename = 'shader_' + pad(programNumber);
        log('');
        log('__FILE__');
        log(basename + '.vert');
        log(definition.vs);
        log('');
        log('__FILE__');
        log(basename + '.frag');
        log(definition.fs);

        // Assuming this is running on Windows
        log('');
        log('__FILE__');
        log(basename + '_vert.hlsl');
        log(dbg.getTranslatedShaderSource(vShader));
        log('');
        log('__FILE__');
        log(basename + '_frag.hlsl');
        log(dbg.getTranslatedShaderSource(fShader));

        return program;
    };

    var loadShaderCache = function() {
        // load shader cache
        var xhr = new XMLHttpRequest();
        xhr.addEventListener('load', function() {
            requestAnimationFrame(function() {
                onShaderLoad(xhr.responseText);
            });
        });
        xhr.open('GET', '../shader-cache.txt');
        xhr.send();
    };

    window.addEventListener('load', function() {
        setTimeout(loadShaderCache, 500);
    });
} else {
    log('webgl2 context is not supported');
}
