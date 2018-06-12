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

    function onShaderLoad() {
        let currentProgram = {};
        currentProgram['vertex'] = document.getElementById('vertex').textContent;
        currentProgram['fragment'] = document.getElementById('fragment').textContent;
        let programs = [currentProgram];

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

        // Dump the shader sources
        var basename = 'shader_' + pad(programNumber);
        log('');
        log('__FILE__');
        log(basename + '.vert');
        log(definition['vertex']);
        log('');
        log('__FILE__');
        log(basename + '.frag');
        log(definition['fragment']);

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

    window.addEventListener('load', function() {
        setTimeout(onShaderLoad, 500);
    });
} else {
    log('webgl2 context is not supported');
}
