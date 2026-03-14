Dependency TreeBanks
============

Tesnière introduced the dependency trees, structural order, the concept of dependency and applied his representation concepts in a variety of languages such as French, Greek, Russian, Italian, and so on. In structural order, syntactic relations are presented in a hierarchical manner as opposed to the linear order. He uses “stemmas” to reflect hierarchy. 

Today, dependency grammars are divided into two. One study from the tradition that applies this distinction to the dependency grammar is the Prague Dependency Treebank (PDT) developed by the Prague School of Functional and Structural Linguistics. A famous example for the other school of thought that displays linear order is the Penn Treebank that functioned between the years of 1989-1996, containing seven million annotated texts from American English. 

In 2005, The Stanford Dependencies developed for the parsing of the English language and to be used in NLP studies and in Stanford Dependency Parser. Stanford Dependencies were acknowledged as the standard for the dependency analyses of English. However, the Stanford Dependency parser could not reach an adequate accuracy when it was used with other dependency schemes. In the following years, the Universal Dependency Treebank (UDT) project pioneered to develop treebanks for languages other than English by transforming the Stanford dependencies into a more inclusive annotation scheme for a diverse set of languages.

The developments in the dependency treebanking made it clear that Turkish language needed a Treebank of its own. The first Turkish language dependency treebank is METU-Sabanci Turkish Treebank. This treebank used a corpus that consisted of 7,262 sentences and included morphological and syntactic annotations. In 2016, this tree-bank was revisited under the name of ITU-METU-Sabancı Treebank (IMST) to reduce the inconsistencies of its earlier version. They succeeded to reduce inconsistencies by applying a new annotation scheme. As a last step, The Bogazici-ITU-METU-Sabancı Treebank (BIMST) is updated as the same corpus. Having a linguistic team of three people, they created a new annotation scheme for IMST and manually re-annotated the data of 5.635 sentences while introducing new dependency relations that were not present in IMST.

Video Lectures
============

[<img src="https://github.com/StarlangSoftware/TurkishDependencyParser/blob/master/video1.jpg" width="50%">](https://youtu.be/fY8tn8ny0m4)[<img src="https://github.com/StarlangSoftware/TurkishDependencyParser/blob/master/video2.jpg" width="50%">](https://youtu.be/vS5o49V0wrU)

For Developers
============
You can also see either [Python](https://github.com/starlangsoftware/TurkishDependencyParser-Py), [Java](https://github.com/starlangsoftware/TurkishDependencyParser), [C++](https://github.com/starlangsoftware/TurkishDependencyParser-CPP), , [C](https://github.com/starlangsoftware/TurkishDependencyParser-C), [Swift](https://github.com/starlangsoftware/TurkishDependencyParser-Swift), [Js](https://github.com/starlangsoftware/TurkishDependencyParser-Js), or [C#](https://github.com/starlangsoftware/TurkishDependencyParser-CS) repository.

## Requirements

* [Python 3.7 or higher](#python)
* [Git](#git)

### Python 

To check if you have a compatible version of Python installed, use the following command:

    python -V
    
You can find the latest version of Python [here](https://www.python.org/downloads/).

### Git

Install the [latest version of Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).

## Pip Install

	pip3 install NlpToolkit-DependencyParser-Cy

## Download Code

In order to work on code, create a fork from GitHub page. 
Use Git for cloning the code to your local or below line for Ubuntu:

	git clone <your-fork-git-link>

A directory called DataStructure will be created. Or you can use below link for exploring the code:

	git clone https://github.com/starlangsoftware/TurkishDependencyParser-Cy.git

## Open project with Pycharm IDE

Steps for opening the cloned project:

* Start IDE
* Select **File | Open** from main menu
* Choose `TurkishDependencyParser-Cy` file
* Select open as project option
* Couple of seconds, dependencies with Maven will be downloaded. 

# Cite

	@INPROCEEDINGS{9259799,
  	author={A. {Kuzgun} and N. {Cesur} and B. N. {Arıcan} and M. {Özçelik} and B. {Marşan} and N. {Kara} and D. B. {Aslan} and O. T. {Yıldız}},
  	booktitle={2020 Innovations in Intelligent Systems and Applications Conference (ASYU)}, 
  	title={On Building the Largest and Cross-Linguistic Turkish Dependency Corpus}, 
  	year={2020},
  	volume={},
  	number={},
  	pages={1-6},
  	doi={10.1109/ASYU50717.2020.9259799}}

For Contibutors
============

### Setup.py file
1. Do not forget to set package list. All subfolders should be added to the package list.
```
    packages=['Classification', 'Classification.Model', 'Classification.Model.DecisionTree',
              'Classification.Model.Ensemble', 'Classification.Model.NeuralNetwork',
              'Classification.Model.NonParametric', 'Classification.Model.Parametric',
              'Classification.Filter', 'Classification.DataSet', 'Classification.Instance', 'Classification.Attribute',
              'Classification.Parameter', 'Classification.Experiment',
              'Classification.Performance', 'Classification.InstanceList', 'Classification.DistanceMetric',
              'Classification.StatisticalTest', 'Classification.FeatureSelection'],
```
2. Package name should be lowercase and only may include _ character.
```
    name='nlptoolkit_math',
```
3. Package data should be defined and must ibclude pyx, pxd, c and py files.
```
    package_data={'NGram': ['*.pxd', '*.pyx', '*.c', '*.py']},
```
4. Setup should include ext_modules with compiler directives.
```
    ext_modules=cythonize(["NGram/*.pyx"],
                          compiler_directives={'language_level': "3"}),
```

### Cython files
1. Define the class variables and class methods in the pxd file.
```
cdef class DiscreteDistribution(dict):

    cdef float __sum

    cpdef addItem(self, str item)
    cpdef removeItem(self, str item)
    cpdef addDistribution(self, DiscreteDistribution distribution)
```
2. For default values in class method declarations, use *.
```
    cpdef list constructIdiomLiterals(self, FsmMorphologicalAnalyzer fsm, MorphologicalParse morphologicalParse1,
                               MetamorphicParse metaParse1, MorphologicalParse morphologicalParse2,
                               MetamorphicParse metaParse2, MorphologicalParse morphologicalParse3 = *,
                               MetamorphicParse metaParse3 = *)
```
3. Define the class name as cdef, class methods as cpdef, and \_\_init\_\_ as def.
```
cdef class DiscreteDistribution(dict):

    def __init__(self, **kwargs):
        """
        A constructor of DiscreteDistribution class which calls its super class.
        """
        super().__init__(**kwargs)
        self.__sum = 0.0

    cpdef addItem(self, str item):
```
4. Do not forget to comment each function.
```
    cpdef addItem(self, str item):
        """
        The addItem method takes a String item as an input and if this map contains a mapping for the item it puts the
        item with given value + 1, else it puts item with value of 1.

        PARAMETERS
        ----------
        item : string
            String input.
        """
```
5. Function names should follow caml case.
```
    cpdef addItem(self, str item):
```
6. Local variables should follow snake case.
```
	det = 1.0
	copy_of_matrix = copy.deepcopy(self)
```
7. Variable types should be defined for function parameters, class variables.
```
    cpdef double getValue(self, int rowNo, int colNo):
```
8. Local variables should be defined with types.
```
    cpdef sortDefinitions(self):
        cdef int i, j
        cdef str tmp
```
9. For abstract methods, use ABC package and declare them with @abstractmethod.
```
    @abstractmethod
    def train(self, train_set: list[Tensor]):
        pass
```
10. For private methods, use __ as prefix in their names.
```
    cpdef list __linearRegressionOnCountsOfCounts(self, list countsOfCounts)
```
11. For private class variables, use __ as prefix in their names.
```
cdef class NGram:
    cdef int __N
    cdef double __lambda1, __lambda2
    cdef bint __interpolated
    cdef set __vocabulary
    cdef list __probability_of_unseen
```
12. Write \_\_repr\_\_ class methods as toString methods
13. Write getter and setter class methods.
```
    cpdef int getN(self)
    cpdef setN(self, int N)
```
14. If there are multiple constructors for a class, define them as constructor1, constructor2, ..., then from the original constructor call these methods.
```
cdef class NGram:

    cpdef constructor1(self, int N, list corpus):
    cpdef constructor2(self, str fileName):
    def __init__(self,
                 NorFileName,
                 corpus=None):
        if isinstance(NorFileName, int):
            self.constructor1(NorFileName, corpus)
        else:
            self.constructor2(NorFileName)
```
15. Extend test classes from unittest and use separate unit test methods.
```
class NGramTest(unittest.TestCase):

    def test_GetCountSimple(self):
```
16. For undefined types use object as type in the type declarations.
```
cdef class WordNet:

    cdef object __syn_set_list
    cdef object __literal_list
```
17. For boolean types use bint as type in the type declarations.
```
	cdef bint is_done
```
18. Enumerated types should be used when necessary as enum classes, and should be declared in py files.
```
class AttributeType(Enum):
    """
    Continuous Attribute
    """
    CONTINUOUS = auto()
    """
```
19. Resource files should be taken from pkg_recources package.
```
	fileName = pkg_resources.resource_filename(__name__, 'data/turkish_wordnet.xml')
```
