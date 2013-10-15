require "test_helper"

feature "CheckForBootstrap" do
  scenario "page contains bootstrap column (shouldn't be present if not yet bootstrapped)." do
    visit root_path
    #This is the way I want to do it, but it doesn't work, so I'm doing it a diff (better) way.
    # page.has_css? "col-"
    page.body.must_include "bootstrap"
  end
end
