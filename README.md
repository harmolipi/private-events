# Private Events
Created as part of [The Odin Project](https://www.theodinproject.com) curriculum.

View on [Github](https://github.com/harmolipi/private-events).

### Functionality

This is the [Private Events Project](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-on-rails/lessons/private-events) project, where I make a site that allows users to create events and manage user signups.

### Thoughts

This was a good project for learning to create more complex relationships between models. The biggest challenge initially was wrapping my mind around the `has_many: through:` relationship, to connect two models through a "through table". Once I got it to work, however, it worked well, and it was great getting to access objects from one model through the other.

Along the way, I did run into an issue that stumped me and will be good to keep in mind in the future. When I first created the join table, I used the built-in `create_join_table` method. For the most part, the table created worked to link my events with my attendees. But when I started trying to add controller actions, I wasn't able to destroy items from my join table (RSVPs). It took a bit, but eventually I discovered that this was due to my RSVP table not having indexes of its own. The table created by `create_join_table` is designed to work with `has_and_belongs_to_many:` relationships - but because of the lack of indexes in the table, you're limited in the things you can do with that connecting model. A friend advised me to lean towards always using tables with indexes, because even if you don't need them in the very beginning, you might need them when you add another piece of functionality in the future. You can avoid hasty and hacky fixes by just putting indexes on your tables.

Also, when I got to the last extra credit step of the project, to allow users to invite other users and only to attend events they've been invited to, I initially started putting that together by adding a second join table, parallel to my initial RSVP table, for invitations. After finally getting all that wired up, I realized that I could've simply added a boolean column to my initial table for whether or not a user has accepted. I went ahead and did that, but it would have been much more difficult had I not had indexes on that table. So I'm glad I took my friend's advice on that one.

God bless.

-Niko Birbilis
