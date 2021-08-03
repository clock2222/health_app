import Rails from '@rails/ujs';
import Turbolinks from 'turbolinks';
import * as ActiveStorage from '@rails/activestorage';
import 'channels';
import 'bootstrap/dist/js/bootstrap';
import '@fortawesome/fontawesome-free/js/all';

Rails.start();
Turbolinks.start();
ActiveStorage.start();
