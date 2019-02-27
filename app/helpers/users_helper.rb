module UsersHelper


  def profile_signed_links_partial_path
    if @user_vendors.exists?
    'users/VariableElements/userHasVendors'
    else
    'users/VariableElements/userHasNoVendors'
    end
  end

  def is_vendor_owner_partial_path
    if @user_is_vendor_owner
      'users/VariableElements/userIsVendorOwner'
    else
      'users/VariableElements/userIsNotVendorOwner'
    end
  end

  def discount_activity_log
    if @user.redeemables.nil?
      'users/VariableElements/userHasNoDiscounts'
    else
      'users/VariableElements/userHasDiscounts'
    end
  end

end


