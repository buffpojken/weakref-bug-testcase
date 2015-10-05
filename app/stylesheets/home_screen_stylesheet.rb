class HomeScreenStylesheet < ApplicationStylesheet

  def setup
    # Add stylesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.white
  end

  def button(st)
    st.frame = {l: 10, t: 100, fr: 10, h: 20}
    st.background_color = color.red
  end 

  def second_button(st)
    st.frame = {l: 10, t: 200, fr: 10, h: 20}
    st.background_color = color.green
    st.text = "Press me upon return!"
  end


end
