const fs = require('fs');

const genesis = JSON.parse(fs.readFileSync('./temp/genesis.json'));
if (!genesis || !genesis.ok) {
  throw 'Please check genesis file';
}
fs.writeFileSync('./temp/genesis.json', JSON.stringify(genesis.data));
