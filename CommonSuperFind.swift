/**
 * 查找两个视图的公共父视图
 */


// 查找给定视图的所有父视图
func findSuperViews(view: UIView) -> [UIView] {
    var superViews = [UIView]()
    var currentView = view.superview
    while currentView != nil {
        superViews.append(currentView!)
        currentView = currentView!.superview
    }
    return superViews
}

// 查找两个视图的公共父视图
func findCommonSuperViews(view1: UIView, view2: UIView) -> [UIView] {
    var commonSuperViews = [UIView]()
    // 获取两个视图的所有父视图
    let superViews1 = findSuperViews(view: view1)
    let superViews2 = findSuperViews(view: view2)
    
    var i = 0
    // 从最顶层的父视图开始比较
    while i < superViews1.count && i < superViews2.count {
        // 注意：这里从数组末尾开始比较，因为最顶层的父视图在数组末尾
        let view1Super = superViews1[superViews1.count - 1 - i]
        let view2Super = superViews2[superViews2.count - 1 - i]
        if view1Super == view2Super {
            commonSuperViews.append(view1Super)
        } else {
            // 如果遇到不同的父视图，就停止比较
            break
        }
        i += 1
    }
    return commonSuperViews
}

// 示例用法
let view1 = UIView()
let view2 = UIView()
let view3 = UIView()
view1.addSubview(view2)
view2.addSubview(view3)

// 查找 view1 和 view3 的公共父视图
let commonSuperViews = findCommonSuperViews(view1: view1, view2: view3)
print(commonSuperViews)
