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

  def dashboard
    @managers = current_manager
    @vendors = Vendor.find(current_manager.vendor_id)
    @vendor_discounts = @vendors.discounts


    @discounts = Discount.new(vendor_id: @vendors.id)

    @active_redeemables = Redeemable.where(vendor_id: @vendors.id, is_redeemed: false)
    @active_exclrewards = Exclreward.where(vendor_id: @vendors.id, is_redeemed: false)
    puts @active_redeemables

    @past_redeemables = Redeemable.where(vendor_id: @vendors.id, is_redeemed: true)
    @past_exclrewards = Exclreward.where(vendor_id: @vendors.id, is_redeemed: true)

    @recent_redeemables = Redeemable.where(vendor_id: @vendors.id, is_redeemed: true, updated_at: 7.days.ago..DateTime::Infinity.new)
    @recent_exclrewards = Exclreward.where(vendor_id: @vendors.id, is_redeemed: true, updated_at: 7.days.ago..DateTime::Infinity.new)

    @reviews = @vendors.reviews
    @average_rating = @reviews.average(:rating).to_i
    @blank_stars =  5 - @average_rating


    respond_to do |format|
      format.js
      format.html
      format.text

    end
  end

  def vendor_info
    @managers = current_manager
    @vendors = Vendor.find(current_manager.vendor_id)
    @vendor_discounts = @vendors.discounts


    @discounts = Discount.new(vendor_id: @vendors.id)

    @active_redeemables = Redeemable.where(vendor_id: @vendors.id, is_redeemed: false)
    @active_exclrewards = Exclreward.where(vendor_id: @vendors.id, is_redeemed: false)

    @past_redeemables = Redeemable.where(vendor_id: @vendors.id, is_redeemed: true)
    @past_exclrewards = Exclreward.where(vendor_id: @vendors.id, is_redeemed: true)

    respond_to do |format|
      format.js
      format.html
    end
  end

  def discount_manager
    @managers = current_manager
    @vendors = Vendor.find(current_manager.vendor_id)
    @vendor_discounts = @vendors.discounts


    @discounts = Discount.new(vendor_id: @vendors.id)

    @active_redeemables = Redeemable.where(vendor_id: @vendors.id, is_redeemed: false)
    @active_exclrewards = Exclreward.where(vendor_id: @vendors.id, is_redeemed: false)

    @past_redeemables = Redeemable.where(vendor_id: @vendors.id, is_redeemed: true)
    @past_exclrewards = Exclreward.where(vendor_id: @vendors.id, is_redeemed: true)

    respond_to do |format|
      format.js
      format.html
    end
  end



  def pending_discounts_portal

    @managers = current_manager
    @vendors = Vendor.find(current_manager.vendor_id)
    @vendor_discounts = @vendors.discounts


    @discounts = Discount.new(vendor_id: @vendors.id)

    @active_redeemables = Redeemable.where(vendor_id: @vendors.id, is_redeemed: false)
    @active_exclrewards = Exclreward.where(vendor_id: @vendors.id, is_redeemed: false)

    @past_redeemables = Redeemable.where(vendor_id: @vendors.id, is_redeemed: true)
    @past_exclrewards = Exclreward.where(vendor_id: @vendors.id, is_redeemed: true)

    respond_to do |format|
      format.js
      format.html
    end

  end



  def pending_exclusive_rewards

    @managers = current_manager
    @vendors = Vendor.find(current_manager.vendor_id)
    @vendor_discounts = @vendors.discounts


    @discounts = Discount.new(vendor_id: @vendors.id)

    @active_redeemables = Redeemable.where(vendor_id: @vendors.id, is_redeemed: false)
    @active_exclrewards = Exclreward.where(vendor_id: @vendors.id, is_redeemed: false)

    @past_redeemables = Redeemable.where(vendor_id: @vendors.id, is_redeemed: true)
    @past_exclrewards = Exclreward.where(vendor_id: @vendors.id, is_redeemed: true)

    respond_to do |format|
      format.js
      format.html
    end

  end



end