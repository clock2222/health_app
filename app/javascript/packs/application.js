import Rails from '@rails/ujs';
import Turbolinks from 'turbolinks';
import * as ActiveStorage from '@rails/activestorage';
import 'channels';
import 'bootstrap/dist/js/bootstrap';
import '@fortawesome/fontawesome-free/js/all';

Rails.start();
Turbolinks.start();
ActiveStorage.start();

require('@rails/ujs').start();
require('turbolinks').start();
require('@rails/activestorage').start();
require('channels');

require('jquery');
require('@nathanvda/cocoon');

import 'cocoon-js';
require('src/cocoon');
