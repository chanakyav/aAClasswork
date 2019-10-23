const APIUtil = require("./api_util");

class FollowToggle {
  constructor(el) {
    this.$el = $(el);
    this.userId = this.$el.data('user-id');
    this.followState = this.$el.data('initial-follow-state');
    this.render();

    this.$el.on("click", e => {
    this.handleClick(e);
    });
  }

  render() {
    switch (this.followState) {
      case 'followed':
        this.$el.prop('disabled', false);
        this.$el.text('Unfollow!');
        break;
      case 'unfollowing..':
        this.$el.prop('disabled', true);
        this.$el.text('unfollowing..');
        break;
      case 'unfollowed':
        this.$el.prop('disabled', false);
        this.$el.text('Follow!');
        break;
      case 'following..':
        this.$el.prop('disabled', true);
        this.$el.text('following..');
        break;
    }
  }

  handleClick(e) {
    e.preventDefault();
    let promise;

    if (this.followState === "followed") {
      this.followState = "unfollowing..";
      this.render();
      promise = APIUtil.unfollowUser(this.userId);

    } else {
      this.followState = "following..";
      this.render();
      promise = APIUtil.followUser(this.userId);
    }

    promise.then(res => {
      this.followState = (this.followState === "following..") ? "followed" : "unfollowed";
      this.render();
    }, () => console.log("failed"));
  }
}


module.exports = FollowToggle;