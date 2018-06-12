function log(str) {
    var logElement = document.getElementById('log');
    logElement.textContent += str + '\n';
}


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

    function insertRandomString(source) {
        source.splice(1, 0, '// Random number ' + Math.random());
    }

    function pad(num) {
        var s = '000' + num;
        return s.substr(s.length - 3);
    }

    // once extracted shaders loaded
    function onShaderLoad(raw) {
        let arrayOfLines = raw.match(/[^\r\n]+/g);
        let programs = [];
        let currentProgram = {};
        let currentShader;
        let capturing = false;
        for (let ii = 0; ii < arrayOfLines.length; ii++) {
            let cur = arrayOfLines[ii];
            if (cur == '__ENDPROGRAM__') {
                insertRandomString(currentShader);
                currentProgram['fragment'] = currentShader.join('\n');
                programs.push(currentProgram);
                currentProgram = {};
                currentShader = [];
                capturing = false;
            } else if (cur == '__VERTEXSHADER__') {
                currentShader = [];
                capturing = true;
            } else if (cur == '__FRAGMENTSHADER__') {
                insertRandomString(currentShader);
                currentProgram['vertex'] = currentShader.join('\n');
                currentShader = [];
                capturing = true;
            } else if (capturing) {
                currentShader.push(cur);
            }
        }
        log('' + programs.length + ' programs found');

        // in next frame so that logs appear
        requestAnimationFrame(function() {
            for(var i = 0; i < programs.length; i++) {
                var program = makeProgram(programs[i], i);
            }
        });
    };


    var makeProgram = function(definition, programNumber) {
        var info, location, i;

        var begin = performance.now();

        // vertex shader compilation
        var vShader = gl.createShader(gl.VERTEX_SHADER);
        gl.shaderSource(vShader, definition['vertex']);
        gl.compileShader(vShader);

        if (! gl.getShaderParameter(vShader, gl.COMPILE_STATUS)) {
            var info = gl.getShaderInfoLog(vShader);
            log('couldn\'t compile vertex shader ' + programNumber);
            log(definition['vertex']);
            log(info.toString());
            return null;
        }

        // gl.finish();

        // fragment shader compilation
        var fShader = gl.createShader(gl.FRAGMENT_SHADER);
        gl.shaderSource(fShader, definition['fragment']);
        gl.compileShader(fShader);

        if (! gl.getShaderParameter(fShader, gl.COMPILE_STATUS)) {
            var info = gl.getShaderInfoLog(fShader);
            log(' ');
            log('couldn\'t compile fragment shader ' + programNumber);
            log(definition['fragment']);
            log(info.toString());
            return null;
        }

        // gl.finish();

        // program
        var program = gl.createProgram();
        gl.attachShader(program, vShader);
        gl.attachShader(program, fShader);

        gl.linkProgram(program);

        if (! gl.getProgramParameter(program, gl.LINK_STATUS)) {
            var info = gl.getProgramInfoLog(program);
            log(' ');
            log('couldn\'t link program ' + programNumber);
            log(info.toString());
            return null;
        }

        var end = performance.now();
        log('Shader ' + pad(programNumber) + ': ' + (Math.round((end - begin) * 100) / 100) + 'ms - shader compilation and program link');
/*
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
*/

        return program;
    };

    function loadExtractedShaders() {
        var xhr = new XMLHttpRequest();
        xhr.addEventListener('load', function() {
            requestAnimationFrame(function() {
                onShaderLoad(xhr.responseText);
            });
        });
        xhr.open('GET', 'extracted-shaders.txt');
        xhr.send();
    };

    window.addEventListener('load', function() {
        setTimeout(loadExtractedShaders, 500);
    });
} else {
    log('webgl2 context is not supported');
}
