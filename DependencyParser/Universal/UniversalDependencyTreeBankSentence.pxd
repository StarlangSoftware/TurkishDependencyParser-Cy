from Corpus.Sentence cimport Sentence
from DependencyParser.ParserEvaluationScore cimport ParserEvaluationScore

cdef class UniversalDependencyTreeBankSentence(Sentence):

    cdef list comments
    cdef list splits

    cpdef int splitSize(self)
    cpdef str getSplit(self, int index)
    cpdef addComment(self, str comment)
    cpdef ParserEvaluationScore compareParses(self, UniversalDependencyTreeBankSentence sentence)
