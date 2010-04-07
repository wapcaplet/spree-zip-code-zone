class Admin::ZipCodeRangesController < Admin::BaseController
  resource_controller
  layout 'admin'

  def index
    @zip_code_ranges = ZipCodeRange.all
  end

  create.wants.html { redirect_to admin_zip_code_ranges_url }
  update.wants.html { redirect_to admin_zip_code_ranges_url }

end
