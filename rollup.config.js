import fs from 'fs';
import path from 'path';

import resolve from '@rollup/plugin-node-resolve';
import stylus from 'rollup-plugin-stylus-compiler';
import css from 'rollup-plugin-css-only';

const root = __dirname
    , src = path.join(root, 'src')
    , dst = path.join(root, 'static', 'assets')
    , mod = path.join(root, 'node_modules')
    ;

const development = {
  input: path.join(src, 'index.js')
, output: {
    file: path.join(dst, 'js', 'script.js')
  , format: 'iife'
  , sourcemap: true
  }
, plugins: [
    resolve()
  , stylus()
  , css({
      output: function(data, _nodes) {
        const file = path.join(dst, 'css', 'style.css');
        fs.mkdir(path.dirname(file), {recursive: true}, (err) => {
          if (err) throw err;
          fs.writeFileSync(file, data);
        });
      }
    })
  ]
};

const production = {
  input: path.join(src, 'index.js')
, output: [{
    file: path.join(dst, 'js', 'script.js')
  , format: 'iife'
  , sourcemap: false
  }]
, plugins: [
    resolve()
  , stylus()
  , css({
      output: function(data, _nodes) {
        const file = path.join(dst, 'css', 'style.css');
        fs.mkdir(path.dirname(file), {recursive: true}, (err) => {
          if (err) throw err;
          fs.writeFileSync(file, data);
        });
      }
    })
  ]
};

export default (args) => {
  if (args.configBuildDebug === true) {
    return development;
  } else if (args.configBuildRelease === true) {
    return production;
  }
  throw new Error("unknown args given :'(");
};
