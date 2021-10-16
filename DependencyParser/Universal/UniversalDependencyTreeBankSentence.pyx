from DependencyParser.Universal.UniversalDependencyRelation cimport UniversalDependencyRelation
from Dictionary.Word cimport Word


cdef class UniversalDependencyTreeBankSentence(Sentence):

    def __init__(self):
        super().__init__()
        self.comments = []

    cpdef addComment(self, str comment):
        self.comments.append(comment)

    def __str__(self) -> str:
        cdef str result
        cdef Word word
        result = ""
        for comment in self.comments:
            result += comment + "\n"
        for word in self.words:
            result += word.__str__() + "\n"
        return result

    cpdef ParserEvaluationScore compareParses(self, UniversalDependencyTreeBankSentence sentence):
        cdef int i
        cdef UniversalDependencyRelation relation1, relation2
        score = ParserEvaluationScore()
        for i in range(len(self.words)):
            relation1 = self.words[i].getRelation()
            relation2 = sentence.getWord(i).getRelation()
            if relation1 is not None and relation2 is not None:
                score.add(relation1.compareRelations(relation2))
        return score
