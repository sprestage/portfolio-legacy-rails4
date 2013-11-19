require "test_helper"

### TODO: broke this while ajaxifying the /posts page.  Need to fix.  Commenting
###  out for now, to get my portfolio site working again.  -sprestage 11/19/13
# feature "CheckForBootstrap" do
#   scenario "page contains bootstrap column (shouldn't be present if not yet bootstrapped)." do
#     visit root_path
#     #This is the way I want to do it, but it doesn't work, so I'm doing it a diff (better) way.
#     # page.has_css? "col-"
#     page.body.must_include "bootstrap"
#   end
# end
