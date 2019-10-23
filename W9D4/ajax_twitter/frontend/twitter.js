const FollowToggle = require('./follow_toggle.js');
const UsersSearch = require('./users_search.js');

$( () => {
  $('button.follow-toggle').each( (i, button) => {  
    let btn = new FollowToggle(button);
    // console.log(btn);
  });

  $('nav.users-search').each( (i, user) => {  
    new UsersSearch(user);
    // console.log(btn);
  });
});