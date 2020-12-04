require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit products_url
  
    assert_selector "h1", text: "Awesome Products"
    assert_selector ".card-product", count: Product.count
  end

  # The test is about Create
  # Successfull Scenario
  test "lets a signed in user create a new product" do
    login_as users(:george) # This is from Warden! A method to help us with devise
    visit "/products/new"
    
    # We fill in an input by providing it's NAME!
    fill_in "product_name", with: "Le Wagon"
    fill_in "product_tagline", with: "Change your life: Learn to code"
    # page.save_screenshot('filled_in_form.png')

    # You click on a button by providing it's TEXT!
    click_on 'Create Product'

    page.save_screenshot('after_click.png')

    # Should be redirected to Home with new product
    assert_equal root_path, page.current_path
    
    assert_text "Change your life: Learn to code"
  end
end
