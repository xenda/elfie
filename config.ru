require 'Elfie'

use Rack::ShowExceptions
use Rack::Reloader


run Elfie.new