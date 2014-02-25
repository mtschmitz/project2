require 'spec_helper'

describe "Static pages" do
  subject { page }

    it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_title(full_title('About'))
    click_link "Blog"
    expect(page).to have_title(full_title('Blog'))
    click_link "FAQ"
    expect(page).to have_title(full_title('FAQ'))
    click_link "Home"
    expect(page).to have_title(full_title(''))
   
  end


  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading)    { 'Blogga' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_title('| Home') }
  end

  describe "Faq page" do
    before { visit faq_path }

    let(:heading)    { 'FAQ' }
    let(:page_title) { 'FAQ' }

    it_should_behave_like "all static pages"
  end


  describe "About page" do
    before { visit about_path }

    let(:heading)    { 'About' }
    let(:page_title) { 'About' }
    
    it_should_behave_like "all static pages"
  end

  describe "Blog" do
    before { visit blog_path }

    let(:heading)    { 'Blog' }
    let(:page_title) { 'Blog' }

    it_should_behave_like "all static pages"
  end

end