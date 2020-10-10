# sundog_app
在Flutter状态管理：Provider4 入门教程（一） 

#Consumer的使用
 
 Consumer本身没有魔法，也没有什么花里胡哨的实现。只不过是在一个新的控件中使用Provider.of，然后将这个控件的build方法委托给lamda里的builder。这个builder会被调用多次。就是这么简单。It allows obtaining a value from a provider when we don't have a BuildContext that is a descendant of said provider, and therefore cannot use Provider.of.
 
 Consumer的设计初衷有两个
 
 •当我们的BuildContext中不存在指定的Provider时，Consumer允许我们从Provider中的获取数据。
 •通过提供更多细小的重绘达到性能的优化。
 
 我们现在遇到的就是第一种情况，至于第二种情况，读者们可自行探讨。所以，我们可以通过加一个Consumer来解决ProviderNotFoundException问题