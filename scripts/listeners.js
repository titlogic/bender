// Generated by CoffeeScript 1.10.0
module.exports = function(robot) {
  robot.hear(/(whistles)/i, function(msg) {
    var response;
    response = ["its dat woo wooooo", "https://soundcloud.com/vibesquad/the-whistles", "http://i.imgur.com/KeepBS0.jpg", "http://24.media.tumblr.com/tumblr_lx31kykJQX1r2tufko1_400.jpg"];
    if (Math.random() < 0.2) {
      return msg.send(msg.random(response));
    }
  });
  return robot.hear(/(tits)/i, function(msg) {
    var response;
    response = ["did someone say tits?", "TITS! ", "Woohoo!!! ... tits. ", "tits!", "tits!", "tits!", "tits! image me boobies", "woohoo! tits! animate me boobies", "Boobies!"];
    if (Math.random() < 0.95) {
      return msg.send(msg.random(response));
    }
  });
};
