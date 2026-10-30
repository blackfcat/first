const {createRequire} = require('node:module');
const path = require('node:path');
const local = createRequire(path.resolve(__dirname, '../remotion-composer/package.json'));
const names = ['remotion', '@remotion/cli', '@remotion/renderer', '@remotion/bundler', '@remotion/captions', '@remotion/google-fonts', '@remotion/media', '@remotion/player', '@remotion/transitions'];
const versions = names.map(name => [name, local(name + '/package.json').version]);
for (const [name, version] of versions) console.log(`${name}: ${version}`);
if (new Set(versions.map(([,v]) => v)).size !== 1) process.exit(1);
console.log('Zod: ' + local('zod/package.json').version + ' (security patch override; Remotion CLI expects 4.5.4)');
