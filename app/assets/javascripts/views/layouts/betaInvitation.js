App.Views.Layouts.Beta = App.Views.Layouts.Beta || {};
App.Views.Layouts.Beta.Invitation = Backbone.Marionette.Layout.extend({
  template: 'layouts/betaInvitation',

  regions: {
    content: '#invite'
  },

  views:{},

  onShow: function() {
    this.views.invitation = App.Views.Beta.Invitation;
    this.content.show(new this.views.invitation);
  }
});

App.addInitializer(function() {
  App.layouts.invitation = new App.Views.Layouts.Beta.Invitation();
});
