var app = app || {};
$(function() {
  'use strict';

  app.LoginView = Backbone.View.extend({

    template : _.template($('#login-modal').html()),

    initialize : function() {
      _.bindAll(this, 'render');
      this.model.bind('change', this.render);
    },

    render : function(eventName) {

    }
  });

}());
