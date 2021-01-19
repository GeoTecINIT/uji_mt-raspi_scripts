const fs = require('fs');

const getEthAddr = () => {
  const configData = fs.readFileSync('./config').toString().split('\n').filter(x => x.startsWith('ETHADDR'));
  if (!configData.length) {
    throw 'ETHADDR in config file not found!';
  }

  const config = configData[0].split('=');
  if (config.length < 2) {
    throw 'Cannot read ETHADDR from config file';
  }

  const ethaddr = JSON.parse(config[1]);
  if (!ethaddr || !ethaddr.startsWith('0x') || ethaddr.length != 42) {
    throw 'Incorrect address';
  }

  return ethaddr;
};

const data = JSON.parse(fs.readFileSync('./temp/api-config.json'));
if (!data || !data.ok) {
  throw 'Cannot load config file';
}

const apiConfig = data.data;
apiConfig.blockchainNetwork.config.address = getEthAddr();

fs.writeFileSync('./temp/api-config.json', JSON.stringify(apiConfig));
