var app = app || {};
(function() {
  'use strict';

  app.Login = Backbone.Model.extend({

    defaults : {
      username : '',
      password : ''
    }
  
  });

}());
