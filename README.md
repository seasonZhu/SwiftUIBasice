# 关于SwiftUI,Swift5.1之后的小感

*Swift5.1之前是一门语言,Swift5.1之后是另外一门语言,作为一个从Swift2.0开始就在持续学习这么语言的我而言,这是我看了今年的WWDC的视频之后最大的感慨.*

从2.0的代码一路走到4.0,每一年的XCode升级都是我的一次噩梦,大量的API修正以及方法名的变更,让我苦恼不已.

这事从4.0之后才稍微好一点,4.2的时候修正了大量的内置类的名字,通知名与枚举归于所使用的类中,不过整体而言还算好.

5.0稳定了ABI,让从4.2升级到5.0平稳过度.

当我觉得终于可以安心的用Swift编码的时候,2019年的WWDC大会就犹如一颗重磅炸弹,在耳边提醒着我,想要安逸的编码是不可能的,唯有不断的学习,才是唯一活下去的出路.

说真的,一路学Swift下来,有的时候真的累了,倦了.

当大家都是讨论SwiftUI那会,我正在用Python写着自动化爬虫不亦乐乎.

不过饭碗还是苹果爸爸的,我不可逃避,也没法逃避必须去学习新的知识.

今年的WWDC大会Swift出了两个可以引发聚变的框架--SwiftUI和Combine.

之前我就看过了Flutter,这货一路的回调以及返回值声明在函数前面的老式方式我实在不能接受,我那会说,出个Swift版本的可能会考虑学一下.

一直都在看RxSwift的教程,说的最多的一句就是RxSwift从入门到放弃,因为这个Rx架构太大了,或许我可以用好它,但是想要真正的掌握又是另外一回事.

于是Apple在稳定了Swift的ABI之后,就抛出了重磅炸弹Swift版本的Flutter--SwiftUI,原生的Rx--Combine.

好了,出来混的迟早要来还的,曾经一度拒绝不想学的东西,到终究成为Apple的一部分.

可惜的是,iOS开发这个行业...

感慨说了这么多,我们来聊一点正经的.

最近几日,我也尝试使用XCode11 beta6去学习,写SwiftUI.边看着WWDC的视频,一点点的敲敲打打.

XCode11集成了Swift Packages工具,所以集成第三方不用依赖cocopods也能很顺利完成.

往往第一次集成需要花的时间很长,20min甚至更长.

值得注意的是需要自行选择所以的分支,Kingfisher框架要使用SwiftUI的特性,必须要引用其xcode 11分支.

抛弃传统的UIKit选用SwiftUI,一方面就如WWDC视频所言,是为了卸下历史的包袱.

UIKit框架下,任何组件都必须继承UIView,UIView很大,功能很全,而我们使用一个控件的时候,往往只是满足一点点需求,那么如此大的继承,对于性能的消耗也是巨大.

而SwiftUI通过协议View精简对于视图的定义,让定义View变得简单.

声明式的语法和链式编程,一旦点起来就停不下来,配合返回在函数最后面,便于理解,易于编程.

如果稍微看看隔壁的TypeScript和Kolin,你会发现编码风格是惊人的相似,这也正是大前端的整体统一.当然Swift撇不开的是OC,虽然看起来已经撇开了,但是TypeScript和Kotlin还有继续背负JavaScript和Java的历史包袱进行前进.

这或许就是Swift真正厉害的地方吧.

最后一个Apple的野心,编写一份SwiftUI代码,几乎可以在Apple的全平台运行(Watch除外),而涉及平台风格兼容,SwiftUI的内部会帮你的处理好.

如果你仔细看看SwiftUI中List,NavigationView在控制器中的定义,你会惊讶的发现,其类是UITableView与UINavigationController,没错,SwiftUI在现阶段可以认为是对于UIKit层代码一次"极致"的封装,最后我们用的组件还是在UIKit中,不过我个人认为随着版本的迭代,抛弃这些历史框架,通过新的方式来创建是必然的事情.

SwiftUI才刚刚开始,就像当年Swift刚刚起步一样,很多内部的事情或多或少无法马上撇干净.

不过随着iOS13的发布,在几年之后,谁又会知道SwiftUI会不会成为iOS开发的主流呢?

也许那会我都转行了吧.

这个[Demo](https://github.com/seasonZhu/SwiftUIBasice](https://github.com/seasonZhu/SwiftUIBasice)
)集成了Alamofire5.0,包含SwiftUI的Kingfisher,我只是用笨拙的方式,跟着视频亦步亦趋的写着涉及网络请求的UI界面.

希望能给各位一点点帮助.

也欢迎一起学习讨论.
