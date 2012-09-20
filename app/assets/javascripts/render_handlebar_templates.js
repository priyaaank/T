Backbone.Marionette.Renderer.render = function(template, data) {
  return HanderbarsTemplates['templates/' + template](data);
};
