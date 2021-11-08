import Rails from '@rails/ujs';
import Turbolinks from 'turbolinks';
import * as ActiveStorage from '@rails/activestorage';
import 'channels';
import 'bootstrap/dist/js/bootstrap';
import '@fortawesome/fontawesome-free/js/all';
import 'cocoon-js';
import 'chart.js/dist/chart';

Rails.start();
Turbolinks.start();
ActiveStorage.start();

require('./category_post');
require('./category');
require('@rails/activestorage').start();
require('channels');
require('jquery');
