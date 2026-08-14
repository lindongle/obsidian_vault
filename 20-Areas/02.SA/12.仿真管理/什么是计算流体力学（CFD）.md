---
title: 什么是计算流体力学（CFD）
updated: 2026-06-12T10:28:04
created: 2026-07-05T17:04:38
---

<span style='color:black'>**什么是计算流体力学（CFD）？**</span>
<span style='color:black'>计算流体力学（CFD）是一门使用计算机根据质量、动量和能量守恒的控制方程来预测液体和气体流动的科学。流体遍布我们周围，与我们的生活密切相关。声带的振动会在空气中产生压力波，使人们能够讲话，也能听到所说的话。如果没有流体，网球的上旋就毫无意义，飞机也不会产生任何升力。 通过CFD，我们可以分析、理解和预测构成世界几乎每个部分的流体。</span>
<span style='color:black'>**计算流体力学示例**</span>
<span style='color:black'>当需要预测流体流动和传热，或了解流体流动对产品或系统的影响时，就可以使用CFD。CFD可分析流体流动的不同属性，例如温度、压力、速度和密度，并可应用于各行业的广泛工程问题，包括：</span>
<span style='color:black'>**航空航天与国防：**CFD可以对飞机周围的气流进行分析，预测升力和阻力，这被称为外流场空气动力学。这一点非常重要，因为公司希望优化飞机设计，以提高性能并减少燃料消耗。此外，CFD还可以对飞机内部的复杂系统进行仿真（如机舱空气循环），以预测空气质量。主要应用包括航空电子冷却、气动光学、外流场、机舱HVAC和推进系统。</span>
![image1](2fe3bdcbd28f460992362202cfd2e8dd.png)
<span style='color:black'>*Ansys Fluent仿真：商用飞机外部空气动力学研究。*</span>
**汽车：**在[电动汽车](https://www.ansys.com/content/ansysincprogram/zh-cn/home/blog/electric-vehicle-development-with-simulation)中，电机和电池电化学在机械、化学和电气工程领域形成了复杂的耦合，而CFD使我们能够在整个多物理场系统中进行详细的传热过程研究。这可以帮助工程师预测电机的冷却效率，并减少可能引发火灾的电池热失控。主要应用包括变速箱润滑、[自动驾驶传感器](https://www.ansys.com/content/ansysincprogram/zh-cn/home/blog/how-to-choose-the-right-sensors-for-autonomous-vehicles)、空气声学、外部空气动力学、电池建模和电机冷却。
![image2](cfedd3ad4f114429beaa1c1cb3711bea.png)
<span style='color:black'>*使用Ansys Fluent GPU求解器求解的驱动程序模型*</span>
**新能源：**作为脱碳的有力支持因素，氢是创造更清洁地球的宝贵燃料。CFD使我们能够对从生产到储存、运输和消耗的整个氢价值链进行建模。CFD可以开展探索性研究，了解氢燃料和其他替代燃料如何用于传统发动机，并确定替代燃料方案的有效性。主要应用包括[PEM电解](https://www.ansys.com/content/ansysincprogram/zh-cn/home/blog/hydrogen-powered-future-with-simulation)、氢的生产、运输、储存和消耗，以及燃料电池利用。
![image3](8b9ae97ae67e4d63a9d4396f68a46378.png)
<span style='color:black'>*在Ansys Fluent中进行的燃烧研究*</span>
<span style='color:black'>**医疗：**在生物医学领域，CFD可以分析人体中的流体流动，例如，流经循环系统的血流和流经呼吸系统的气流。它还可用于加速医疗设备的开发，以及评估新药的潜在疗效。主要应用包括心血管、呼吸系统、生物制药。</span>
<span style='color:black'></span>
<span style='color:black'>**计算流体力学的工作原理**</span>
<span style='color:black'>在计算机上求解流体流动的方法有很多。在开始之前，您需要确定在高维度层面将使用哪种方法，即求解哪些控制方程。此选择将缩小可用计算方法的范围。假设选择了连续介质方法（这很常见），则基本上有三个步骤。</span>
<span style='color:black'>首先，确定流体流动域（要计算的连续区域）（通常由CAD模型表示）。然后，应用网格将该域分解为定义良好的单元。最后，计算机在每个单元内求解控制流体方程的离散版本。在高性能计算（HPC）环境中，一个可选步骤是将不同的单元组分配给不同的计算机进行并行处理。</span>
<span style='color:black'>**1.确定要求解的流体流动域**</span>
![image4](495cc7c2225544898b1892525b1dbca2.png)
<span style='color:black'>**2.将计算区域离散化为所需的网格尺寸**</span>
![image5](e490ba1b604140fd90546bf3526caad9.png)
<span style='color:black'>**2.将不同的计算区域分配到不同的计算处理器，并应用适当的微积分方程**</span>
![image6](edbedad38127443d84d6c6454b1ff235.png)
<span style='color:black'>**流体流动建模的挑战**</span>
<span style='color:black'>流体流动的复杂性使得在计算机上进行建模本身就很困难。多物理场相互作用、非线性和不稳定性，是促使流体分析变得如此具有挑战性的一些复杂因素。</span>
<span style='color:black'>**多物理场相互作用：**流体通常不会单独流动——它们在结构内部、穿过结构以及在结构周围流动。想想在风中移动的树。当树移动时，它会改变风，而风也会改变树。这种流体与结构相互作用的耦合问题，需要采用多物理场方法进行建模。</span>
诸如[Fluent](https://www.ansys.com/content/ansysincprogram/zh-cn/home/products/fluids/ansys-fluent)和[LS-DYNA](https://www.ansys.com/content/ansysincprogram/zh-cn/home/products/structures/ansys-ls-dyna)等Ansys CFD软件，可以求解类似的流固耦合问题（有时需要与结构力学求解器耦合，如[Ansys Mechanical](https://www.ansys.com/content/ansysincprogram/zh-cn/home/products/structures/ansys-mechanical)）。即使单独考虑流体，许多现实场景也涉及多种流体（例如，气泡在水中上升）和/或流体的化学成分通过反应（例如，飞机发动机内的燃烧流或汽车电池中的化学反应）发生变化。Ansys Fluent尤其适合对上述情况进行建模。
<span style='color:black'>**非线性：**在流体力学中，控制物理方程的这一性质意味着流体与*自身*的相互作用。与工程相关的大多数流动在本质上都是湍流。湍流是流体力学中非线性运动的一个示例，因为湍流会影响其他量，如传热和动量，而这些量反过来又会影响湍流。所谓湍流，指的是随机的、混乱的和不确定的流动，就像飞机广播中机长所说的“气流”。</span>
<span style='color:black'>这种随机性，就是“计算流体力学”这个词会包含“计算”这关键二字的原因。非线性和湍流，使我们无法用笔和纸来手动求解这些方程。这必须在计算机上完成（除了一些低维度的简单层流）。即使如此，CFD问题的答案也不是一个简单的解，而是计算机将一堆微积分转化为代数后计算出的解。</span>
<span style='color:black'>**不稳定性：**湍流的一个固有特征是不稳定性。这意味着空间中任何固定点的流量都会随时间而变化。如果这种不稳定性非常明显（例如，汽车在高速公路上行驶），那么高精度仿真需要瞬态求解方案，这就会大大增加成本。</span>
<span style='color:black'>湍流这一普遍现象已经困扰了几代科学家和工程师。这是一个如此复杂的问题，以至于诺贝尔物理学奖得主Richard Feynman将其称为“经典物理学中尚未解决的最重要的难题”。虽然CFD无法从数学角度求解湍流问题，但它使工程师可以在设计中创建考虑湍流影响的模型。</span>
<span style='color:black'>**计算流体力学的历史**</span>
<span style='color:black'>计算流体力学的研究始于20世纪初，当时人们首次开发了数学模型，用于解决流体流动问题。随着计算机在20世纪中期出现，该领域凭借其计算速度以及对日益复杂的问题进行建模的能力而迅速发展。</span>
<span style='color:black'>**早期发展（1900年代-1940年代）：**</span>
<span style='color:black'>流体流动的基本控制方程（称为纳维-斯托克斯方程）已被构建。这些方程为理解流体行为提供了理论框架。</span>
<span style='color:black'>**计算机出现（1950年代-1960年代）：**</span>
<span style='color:black'>这一转折点使高速执行复杂的计算成为可能，并为曾经被认为无法解决的流体流动问题提供了答案。</span>
<span style='color:black'>**数值方法（1960年代-1970年代）：**</span>
<span style='color:black'>数值方法的应用，使研究人员能够将域划分为由较小单元组成的网格，以求解每个单元内的流体属性。这样就可以分析更复杂的几何结构和边界条件。</span>
<span style='color:black'>**高性能计算（HPC）（2000年至今）：**</span>
随着[HPC](https://www.ansys.com/content/ansysincprogram/zh-cn/home/it-solutions/hpc)的进步，人们可以在更短的时间内运行规模更大、更复杂的CFD模型。HPC强大的处理功能使工程师能够对复杂的流程执行规模庞大的计算，例如，分析飞行中的整架飞机。
<span style='color:black'>**CFD的控制方程**</span>
<span style='color:black'>流体的运动对于许多人来说并不直观，因为它的运动方式与固体物体截然不同。如果您在房间中抛球，球的形状或质量不会改变。但您不能以同样的方式“抛”空气。CFD的控制方程可帮助我们补偿流体的任意形状和不可预测性。</span>
<span style='color:black'>纳维-斯托克斯方程（Navier-Stokes equations）以克劳德-路易·纳维（Claude-Louis Navier）和乔治·加布里埃尔·斯托克斯（George Gabriel Stokes）命名，是描述流体运动的偏微分方程。它们开发于19世纪中期，是了解流体力学的基本方程，可用于对所有类型的流体流动进行建模，例如机翼周围的气流和通过发动机的燃料流。它们基于质量、动量和能量的守恒方程，被视为流体行为建模的主要控制方程。</span>
<span style='color:black'>**1.质量守恒：连续性方程**</span>
<span style='color:black'>该方程指出，给定体积流体的质量必须保持恒定，除非存在质量流入或流出：</span>
![image7](9ae883aa45304e80a301b67a090381f7.png)
<span style='color:black'>其中⍴是流体密度，*t*是时间，**u**是速度矢量，∇是梯度算子。</span>
<span style='color:black'>**2.动量守恒：牛顿第二定律**</span>
<span style='color:black'>动量方程指出，流体体积内动量的变化率等于作用在其上的力之和，包括压力和重力。对于粘度恒定的不可压缩流体，我们可以将其写为：</span>
![image8](ce6018e9c9654808a4db250c5995bdf2.png)
<span style='color:black'>其中p为静态压力，v为粘度，ƒb为物体力（通常为重力）。</span>
<span style='color:black'>**3.能量守恒：热力学第一定律**</span>
<span style='color:black'>能量方程指出，流体总能量的变化必须等于系统中增加或去除的能量（例如通过传导或对流传热）。</span>
![image9](3d0150b1708642698d1101f755b27f1e.png)
<span style='color:black'>其中**h**tot是总焓，λ是导热率，**T**是温度，S**E**是外部热源。 ∇∙(**u**∙t )是粘性功项，表示粘性应力产生的功。</span>
<span style='color:black'>**CFD的进步**</span>
CFD的潜力仅受计算硬件能力的限制。随着硬件和软件的进步，科学计算可以从CPU过渡到GPU，包括将[多个GPU应用于CFD仿真](https://www.ansys.com/content/ansysincprogram/zh-cn/home/blog/unleashing-the-power-of-multiple-gpus-for-cfd-simulations)，从而实现速度和准确性的巨大飞跃。完全原生的多GPU实现将进一步加速CFD仿真，推动新的性能水平，减少硬件成本，并降低功耗。

*From \< <https://www.ansys.com/zh-cn/simulation-topics/what-is-computational-fluid-dynamics>\>*
