# mindsRRM
It is a vast system that combines customer relationship management (CRM), enterprise resource planning (ERP), and project management systems (PMS) for large industries to manage files, projects, and resources.
**说明书**

**版本号：v1.0 2019-2-14**




***Minds网址*：10.134.204.95/plat**

**请使用IE8浏览器**

**为达到最佳使用效果**

**或在生产力工具菜单栏下载Firefox或者Chrome浏览器**


![Aspose Words b4eb518a-6f7d-4235-bf70-1f7e6bb5e11b 001](https://github.com/jinushini/mindsRRM/assets/5149169/1091ecf5-4f0a-4a38-94d4-728552a8811f)

1. 研制流程的再设计概述：

通过对研制流程的一年的研发，第一版的研制流程已经上线，在于计划人员的沟通过程中，发现还有很多地方不符合实际的使用需求，需要进行调整。现在就研制流程中的各个环节进行以下的说明和描述。

1. 词汇表：
![Aspose Words b4eb518a-6f7d-4235-bf70-1f7e6bb5e11b 002](https://github.com/jinushini/mindsRRM/assets/5149169/9b818249-45fb-42e0-a6c5-6020ebb23fd2)

现就在整个研制流程中出现的词汇统一进行定义，以便描述和讨论：
![Aspose Words b4eb518a-6f7d-4235-bf70-1f7e6bb5e11b 005](https://github.com/jinushini/mindsRRM/assets/5149169/1dc37280-7f4a-4577-8176-da100c8c37d3)
![Aspose Words b4eb518a-6f7d-4235-bf70-1f7e6bb5e11b 007](https://github.com/jinushini/mindsRRM/assets/5149169/a1a8e873-840d-4fa7-918d-da69d730cdf5)
![Aspose Words b4eb518a-6f7d-4235-bf70-1f7e6bb5e11b 006](https://github.com/jinushini/mindsRRM/assets/5149169/b4f7b3e0-4bf1-4fd1-81ac-7e3403829354)

- 研制流程：曾用名称 大流程、流程串
- 阶段：根据当前的各自研制流程分析出的可以在同一时期完成的任务归并为同一阶段的事务，比如设计阶段，详细设计阶段，生产阶段等。同一阶段下的所有事物完成后，可以自动进入下一阶段
- 子任务：可以看做是一个流程中的单个需要执行的事项，可以由单个或者多个同一个执行者或者多个执行者一系列的操作动作构成，或者称为单一的事件。可以是一个自闭环的小的审签流程、或者仅完成一个动作操作。子任务是流程串中的最小级别的工作单元。
- 子流程串：子流程串和子任务属于同一级别的动作集合，区别在于，子流程串具有一个完整研制流程的各个阶段和多个子子任务构成。
- 派工：即派工流程，A给B派工；B反馈，并选择C审核；C审核通过，闭环；C审核不通过，B重新反馈，C继续审核...下图为一个典型的派工流程

![](Aspose.Words.b4eb518a-6f7d-4235-bf70-1f7e6bb5e11b.001.png)

图1-1 派工流程图

反馈页面默认使用通用表单如下图：

![](Aspose.Words.b4eb518a-6f7d-4235-bf70-1f7e6bb5e11b.002.png)

图1-2 派工流程反馈页面示意图

- 订单库：存放订单数据的库。
- 产品（单机）：整机/单机。有独立订单号的整机、单板、模块、开关等。
- 小整机：整机/单机分解出来的电源、单板等。无独立订单号。
- 订单分解：整机/单机订单分解出电源、单板的过程。

1. 岗位角色设定：
![Aspose Words b4eb518a-6f7d-4235-bf70-1f7e6bb5e11b 013](https://github.com/jinushini/mindsRRM/assets/5149169/032292f4-5cc3-4057-a49f-1d037130b5a0)

注：相关人员，已经用不同的颜色标出，便于讨论。
## **1、岗位：**
1	单机主管（主管设计师）
![Aspose Words b4eb518a-6f7d-4235-bf70-1f7e6bb5e11b 014](https://github.com/jinushini/mindsRRM/assets/5149169/e342a0dc-eb05-44e8-a064-dbb7acfc6868)

2	计划管理（调度/计划）
![Aspose Words b4eb518a-6f7d-4235-bf70-1f7e6bb5e11b 015](https://github.com/jinushini/mindsRRM/assets/5149169/47d1b4fa-5f1b-41ac-a792-4fcd34745eab)

3	产品保证（产保）

4	质量管理（质量）

5 结构主管（结构）
![Aspose Words b4eb518a-6f7d-4235-bf70-1f7e6bb5e11b 016](https://github.com/jinushini/mindsRRM/assets/5149169/4a26fded-a9d8-42b5-abda-f9040c65028c)

6 工艺主管（工艺）

7 元器件管理员
