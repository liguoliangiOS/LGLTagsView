# LGLTagsView
下面的是代码说明和代码：
（1）包括两个部分：LGLTagsFrame(计算标签的frame)  LGLTagsView（标签的展示的view）
（2）使用注意：请先把标签数组输入LGLTagsFrame计算出标签的总高度 再来利用创建LGLTagsView。

```
LGLTagsFrame * frame = [[LGLTagsFrame alloc] init];
    frame.tagsArray = [dataSource copy];
    LGLTagsView  * tagView = [[LGLTagsView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, frame.tagsTotalHeight) tagsFrame:frame.tagsFrames selectTagBlock:^(NSString *tagName) {
        // 在这里获得标签的点击回调的值
    }];
[self.view addSubview:tagView];
```
