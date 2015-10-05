class HomeScreen < LoaderScreen
  title "Your title here"
  stylesheet HomeScreenStylesheet

  def on_load

    # Uncomment this to see what showLoader should really do.
    # showLoader

    append!(UILabel, :button).on(:tap) do |sender|
          loginManager = FBSDKLoginManager.alloc.init
          loginManager.logInWithReadPermissions(["public_profile"], handler: lambda do |result, error|
            if error
              app.alert("An unknown error ocurred when communicating with Facebook, try again!")
            elsif result.isCancelled
              app.alert("You cancelled the process. Please select another authentication method!")
            else

              # This showLoader will suddenly not find the styles :loader / :loader_background, even 
              # though they are defined in application_stylesheet.rb (since the WeakRef is lost). 
              # RMQ will throw on "style_name :loader_background doesn't exist for a UIView. Add 'def loader_background(st)' to NilClass class"
              showLoader

              
            end
          end)
        end

    # Tapping this upon return will result in a recycled WeakRef-crash IF tapped after cycling through the above action. Tapping
    # it BEFORE yields expected behavior (a loader is shown)
    append!(UIButton, :second_button).on(:touch_up_inside) do |sender|
      showLoader
    end

  end

end
