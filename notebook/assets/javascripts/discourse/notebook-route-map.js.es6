/**
 * Links the path `/notebook` to a route named `notebook`. Named like this, a
 * route with the same name needs to be created in the `routes` directory.
 */
export default function () {
  this.route('notebook', { path: '/notebook' });
  this.route('keynotes', { path: '/keynotes'});
  this.route('grapes', { path: '/grapes'})
}
