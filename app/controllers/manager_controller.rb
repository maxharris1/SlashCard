class ManagerController < ApplicationController
  before_action :authenticate_manager!


  def portal
    @managers = current_manager
    @vendors = Vendor.find(current_manager.vendor_id)
    @vendor_discounts = @vendors.discounts


    @discounts = Discount.new(vendor_id: @vendors.id)

    @active_redeemables = Redeemable.where(vendor_id: @vendors.id, is_redeemed: false)
    @active_exclrewards = Exclreward.where(vendor_id: @vendors.id, is_redeemed: false)

    @past_redeemables = Redeemable.where(vendor_id: @vendors.id, is_redeemed: true)
    @past_exclrewards = Exclreward.where(vendor_id: @vendors.id, is_redeemed: true)
  end






end