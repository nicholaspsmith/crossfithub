(function () {

  window.CommentInputView = Backbone.View.extend({
    events: {
      'submit': 'createComment'
    },
    initialize: function (options) {
      if (g.user) {
        $(this.el).show();
      }
    },
    createComment: function (e) {
      e.preventDefault();
      // This converts the form's input values into a nice javascript object
      var newCommentData = _.formToJSON(this.el);
      console.log('New comment data:', newCommentData);

      // Adds our new comment to the collection
      this.collection.create(newCommentData);
      this.

      // Clears input values
      $(this.el).find('input[type="text"], textarea').val('');
    }
  });

})();
