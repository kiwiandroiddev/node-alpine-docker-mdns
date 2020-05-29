// import the module
const mdns = require('mdns');

// advertise a http server on port 4321
const ad = mdns.createAdvertisement(mdns.tcp('http'), 4321);
ad.start();