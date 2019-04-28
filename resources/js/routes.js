const home = require('./components/Home.vue');
const about = require('./components/About.vue');
const contact = require('./components/Contact.vue');
const AllUsers = require('./components/AllUsers.vue');

export const routes = [
{
	path: '/',
	component: AllUsers
},
{
	path: '/about',
	component: about
},
{
	path: '/contact',
	component: contact
},,
{
	path: '/users',
	component: AllUsers
},
];