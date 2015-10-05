class LoaderScreen < PM::Screen

	def defaultSize
		20
	end

	def showLoader(frame = nil)
	#	self.view.userInteractionEnabled = false
		if frame.nil?
			frame = CGRectMake(defaultSize, defaultSize, defaultSize, defaultSize)
			loader_view = UIView.alloc.initWithFrame(CGRectMake(device.width/2-(defaultSize*3)/2, device.height/2-(defaultSize*3)/2, defaultSize*3, defaultSize*3))			
			loader_view.apply_style(:loader_background)
			loader = addLoader(frame)
			loader_view.addSubview(loader)
		else
			loader = addLoader(frame)
			loader_view = loader
		end
		@loader_view = loader_view
		self.view.addSubview(loader_view)
		loader.apply_style(:loader)
		loader.startAnimation
	end

	def hideLoader(animated = true)
		return unless @loader
		@loader.stopAnimation
		if animated
			UIView.animateWithDuration(0.5, animations: lambda do 
				@loader_view.alpha = 0
			end, completion: lambda do |success|
				self.view.userInteractionEnabled = true
				@loader_view.removeFromSuperview
				@loader_view = nil
			end)
		else
			self.view.userInteractionEnabled = true
			@loader_view.removeFromSuperview
			@loader_view = nil
		end
	end

	private

	def addLoader(frame)
		if @loader
			@loader.frame = frame
		else
			@loader = BLMultiColorLoader.alloc.initWithFrame(frame)
		end
		@loader.colorArray = [color.white]
		@loader
	end

end