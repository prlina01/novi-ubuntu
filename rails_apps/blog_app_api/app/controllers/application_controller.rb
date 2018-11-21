class ApplicationController < ActionController::Base
  include DeviseWhitelist
  include JsonResponse
end
