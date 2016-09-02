# UI-02-ViewPackage
将子控件封装到View中
-	如果一个view内部的子控件比较多，一般会考虑自定义一个view，把它内部子控件的创建屏蔽起来，不让外界关心

-	外界可以传入对应的模型数据给view，view拿到模型数据后给内部的子控件设置对应的数据

-	封装控件的基本步骤
	- 在initWithFrame:方法中添加子控件，提供便利构造方法(如果调init也可以只不过init底层会调用initWithFrame:方法)
	- 在layoutSubviews方法中设置子控件的frame（一定要调用super的layoutSubviews）
	- 增加模型属性，在模型属性set方法中设置数据到子控件上

