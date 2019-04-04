# EffectiveOC2Demo
EffectiveObject-C 2.0 demo练习


概念篇：讲解一些概念性知识

 * [理解“属性”这一概念](#concept-property)
 * [理解“等同性”这一概念](#concept-equal)

规范篇：讲解一些为了避免一些问题或者后续开发提供便利所需遵循的规范性知识

 * [在类的头文件中尽量少引用其他头文件](#standard-declaring)
 * [多用字面量语法，少用与之等价的方法](#standard-literal)
 * [多用类型常量，少用 #define 预处理指令](#standard-define)
 * [用枚举表示状态、选项、状态码](#standard-enum)
 * [在对象内部尽量直接访问实例变量](#standard-direct-access)

技巧篇：讲解一些为了解决某些特定问题而需要用到的技巧


## <a name="standard-declaring"></a>第2条：在类的头文件中尽量少引用其他头文件（OC1_2）

### 类声明

向前声明（Forward Declaring）
某个A类的头文件中使用B类时，可使用`@class`向编译器声明该类即可。

1. 使用`@import`声明不够优雅，编译使用A类文件时，不需要知道B类全部细节，只需知道B类名即可。
2. 减少编译时间和降低依赖关系。将引入头文件的时机尽量延后，只有在确认使用时引入（实现文件必须知道其所有接口细节，则需要引入该类），减少类的使用者引入头文件的数量。
3. 解决两个类相互引用的问题。如果在各自头文件中引入对方的头文件，则会导致`‘循环引用’`，意味着两个类中有一个无法被正确编译。

**但是并不是所有情况都适用向前声明。**

1. 如果该类继承某个超类，则必须引入超类的头文件。
2. 如果该类遵从某个协议（protocol），则必须引入协议的头文件。

### 协议声明

1. 要向外界公布此类实现了某协议，那么则需要在接口中声明。对应协议最好是单独一个头文件。
2. 只在类内部使用，比如	`委托协议`，一般都是在`class-continuation分类`里声明。

* 在委托对象头部文件中定义委托协议，可向前声明该委托对象
* 在`class-continuation分类`里声明遵从该委托协议。


## <a name="standard-literal"></a>第3条：多用字面量语法，少用与之等价的方法（OC1_3）
* 使用字面量语法来创建字符串、数值、数组、字典，更加简明和具有可读性。
* 数组和字典可通过取下标操作进行访问
* 使用字面量语法来创建数组或字典时，若值中有nil，则会抛出异常
* 例子：

	**字符串字面量 NSString**
	 
	``` 
	NSString * str = @"just test";
	```
	 
	**字面数值 NSNumber，整数、浮点数、布尔值封装进oc对象**  
	 
	```
	NSNumber *number = @1;  
	NSNumber *number1 = @1.5f;
	NSNumber *number2 = @YES;
	NSNumber *number3 = @(2 * 2.5f);
	```
	**字面量数组 NSArray**
	 
	```
	NSArray *array = @[@"A",@"B",@"B"];
	NSString *value = array[1];//取下标
	```
	**字面量字典 NSDictionary**
	
	```
	NSDictionary *dic = @{@"key0":@"value0",
	                      @"key1":@YES,
	                      @"key2":@1
	                      };
	NSString *value1 = dic[@"key0"];//取下标
	```
	**可变字典和数组可通过取下标更改值**
	
	```
	NSMutableArray *mutableArray = [array mutableCopy];
	mutableArray[0] = @"D";
	NSMutableDictionary *mutableDic = [dic mutableCopy];
	mutableDic[@"key0"] = @"value";
	```

## <a name="standard-define"></a>第4条：多用类型常量，少用 #define 预处理指令（OC1_4）

* 优先使用类型常量定义常量，少用`#define`预处理命令。预处理命令定义的常量不含类型信息，且容易被替换掉。
* 定义不对外声明的常量。一般都在实现文件中使用`static const`来定义，一般在前面加上小写字母`k`。

	```
	//定义常量正确方式：使用static const
	//试图修改const修饰符所声明的变量，编译器会报错
	//static修饰符意味着该变量仅在定义此变量的编译单元（.m文件）中可见
	static const NSTimeInterval kAnimationDuration = 0.3;
	static NSString* const kAnimationNotificatino = @"kAnimationNotificatinon";
	```
* 定义全局变量符号。一般在头文件中使用`extern`来声明，并在相关实现文件中定义其值，通常用与之相关的类名做前缀。

	```
	//  ViewController.h
	...
	//extern关键字告诉编译器，向全局符号表中注册一个符号（编译器无需查看其定义，直接代码使用该常量，当链接成二进制文件之后，编译器会在数据段为字符串分配空间）
	extern const NSTimeInterval EOCViewControllerAnimationDuration;
	extern NSString* const EOCViewControllerDidAnimationNotification;
	
	//  ViewController.m
	...
	NSString *const EOCViewControllerDidAnimationNotification =	@"EOCViewControllerDidAnimationNotification";
	const NSTimeInterval EOCViewControllerAnimationDuration = 0.5;
	```
	
## <a name="standard-enum"></a>第5条：用枚举表示状态、选项、状态码（OC1_5）

* 枚举定义方式：

	```
	//枚举定义1
	typedef NS_ENUM(NSUInteger, EOCConnectionState) {
	    EOCConnectionStateDisconnected,
	    EOCConnectionStateConnecting,
	    EOCConnectionStateConnected
	};
	
	//使用NS_OPTIONS定义按位或操作的枚举，对1左移
	typedef NS_OPTIONS(int, EOCPermitted) {
	    EOCPermittedUp      = 1 << 0,
	    EOCPermittedDown    = 1 << 1,
	    EOCPermittedLeft    = 1 << 2,
	    EOCPermittedRight   = 1 << 3
	};
	EOCPermitted permitted = EOCPermittedUp | EOCPermittedDown;
	
	//枚举定义2
	typedef enum:NSUInteger {
	    GeoUserStateUnkown,
	    GeoUserStateEnter,
	    GeoUserStateExit
	} GeoUserState;
	```
* 在处理枚举类型的switch语句中不要实现defualt分支。这样若有枚举没有处理，编译器则会报警。

	```
	GeoUserState state = GeoUserStateUnkown;
	switch (state) {
	    case GeoUserStateUnkown:
	    case GeoUserStateEnter:
	    case GeoUserStateExit:
	    NSLog(@"GeoUserState :%@",@(state));
	    break;
	}
	```

## <a name="concept-property"></a>第6条：理解“属性”这一概念（OC2_6）

**属性语法**

* `@property`语法会在编译期自动合成存取方法，同时生成适当类型的实例变量（属性名前面加下划线当做实例变量名）

	```
	//EOCPersion.h
	@property NSString *firstName;
	@property NSString *lastName;
	
	//xxx.m
	EOCPersion *persion = [[EOCPersion alloc] init];
	//要访问属性，可使用点语法
	persion.firstName = @"aaaa";
	NSString *firstName = persion.firstName
	//也可直接使用存取方法
	[persion setLastName:@"bbbb"];
	NSString *lastName = [persion lastName];
	```
* `@synthesize`语法可指定实例变量的名字，在类的实现代码里使用。

	```
	//EOCPersion.m
	@implementation EOCPersion
	@synthesize firstName = _myFirstName;
	@synthesize lastName = _myLastName;
	//即使指定不同的实例变量名字，但不影响属性生成的存取方法，其值相等
	-(NSString *)fullName{
	    return [_myFirstName stringByAppendingString:_myLastName];
	//    return [self.firstName stringByAppendingString:self.lastName];
	}
	...
	@end
	```
* `@dynamic`语法告诉编译器不要自动创建实例变量和存取方法，在类的实现代码里使用。

	```
	//EOCPersion.m
	@interface EOCPersion(){
	//手动创建实例变量
	NSInteger _age;
	}
	@end
	
	@implementation EOCPersion
	@dynamic age;
	//手动创建存取方法
	- (void)setAge:(NSInteger)age{
	    _age = age;
	}
	- (NSInteger)age{
		return _age;
	}
	...
	@end
	```

**属性特性**  

原子性  

* `nonatomic`: 非原子操作，不使用同步锁，多线程并发访问会提高访问效率
* `atomic`: 原子操作，加同步锁，提供多线程安全，只在其`setter`或`getter`方法时加锁安全机制，其他的线程安全不负责

	属性默认的是原子操作，但是一般开发使用非原子操作。因为关于线程安全，只是依赖原子操作根本实现不了。
 
读写权限
	
* `readwrite`: 创建存取方法
* `readonly`: 只创建获取方法

内存管理语义

* `assign`: 修饰基础数据类型以及C数据类型。
* `strong`: 修饰OC对象，尤其为可变类型的属性必须使用strong修饰，它不会生成新的内存地址，会使引用计数加1。
* `weak`: 修饰OC对象，在对象被销毁时会被置为nil。(delegate一般使用weak)
* `unsafe_unretained`: 修饰OC对象，在对象被销毁时不会置nil
* `copy`: 一般用来修饰不可变类型对象以及block，它会生成新的内存地址，但不会对原对象的引用计数发生变化。

	```
	//assign
	@property (nonatomic,assign) NSInteger count;
	@property (nonatomic,assign) BOOL isOK;
	
	//strong
	@property (nonatomic, strong) id objectA;
	@property (nonatomic, strong) UIViewController *viewController;
	
	//weak
	@property (nonatomic, weak) id delegate;
	
	//copy
	@property (nonatomic, readonly, copy) NSString *parentName;
	@property (nonatomic, readwrite, copy) void (^callback)(NSString*);
	```

**关于NSString为什么使用copy而不是strong关键字**  

NSString是不可变类型，若其数据源为不可变类型，那么使用copy或strong等同效果;  
若其数据源为可变类型，当修改数据源时，使用copy修饰的字符串则不会发生改变，但是使用strong修饰的会因为数据源变化而变化。**关键就在于copy会生成新的内存地址，strong则指向同一个内存地址。**


## <a name="standard-direct-access"></a>第7条：在对象内部尽量直接访问实例变量（OC2_7）

**一般情况**

建议在读取实例变量时候采用直接访问形式，在设置实例变量时候通过属性存取方法来设置。

* 直接访问实例变量速度快；绕过相关属性所定义的内存管理语义；不会触发KVO通知
* 通过属性访问有助于排查与之相关的错误，可增加断点来监控该属性的调用者及访问时机

**特殊情况**

* 初始化总是应该使用直接访问实例变量，避免子类覆写其设置方法

	```
	-(instancetype) initWithFullname:(NSString *)name{
	    NSArray *components = [name componentsSeparatedByString:@" "];
	    if(self = [super init]){
	        _firstName = [[components objectAtIndex:0] copy];
	        _lastName = [[components objectAtIndex:1] copy];
	    }
	    return self;
	}
	```

* 懒性初始化，必须通过‘获取方法’来访问属性。如果某属性不常用且创建成本较高，则应该使用懒加载

	```
	//EOCPerson.m
	-(EOCBrain *)brain{
	    if(!_brain){
	        _brain = [[EOCBrain alloc] init];
	    }
	    return _brain;
	}
	-(void) didBrainTest{
	//    //直接访问实例变量，可能会出现没有初始化
	//    [_brain testSomething];
	    //懒性初始化的属性，应该调用获取方法来访问
	    [[self brain] testSomething];
	}
	```
	
## <a name="concept-equal"></a>第8条：理解“等同性”这一概念（OC2_8）

* 自定义对象判断等同性关键方法：isEqual 和 hash
* 根据等同性约定：若两对象相等，则其哈希码也相等；但是两个哈希码相同的对象却未必相等。

	```
	- (BOOL)isEqual:(id)object{
		//判断类型是否一样(看情况而定)
		if([self class] == [object class]){
		    return [self isEualToPerson:(EOCPerson *)object];
		}else{
		    return [super isEqual:object];
		}
	}
	//提高效率，无需判断类型
	- (BOOL) isEualToPerson:(EOCPerson *)other{
		//判断相同指针地址，则为同一个对象
		if(self == other) return YES;
		//判断属性值是否相等
		if(![_firstName isEqualToString:other.firstName]){
		    return NO;
		}
		if(![_lastName isEqualToString:other.lastName]){
		    return NO;
		}
		if(_age != other.age){
		    return NO;
		}
		return YES;
	}
	- (NSUInteger)hash{
		NSUInteger fhash = [_firstName hash];
		NSUInteger lhash = [_lastName hash];
		NSUInteger ahash = _age;
		// ^ :位异或 第一个操作数的的第n位于第二个操作数的第n位相反，那么结果的第n为也为1，否则为0
		return fhash ^ lhash ^ ahash;
	}
	```

