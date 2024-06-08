cdef class ParserEvaluationScore:

    def __init__(self, float LAS = 0.0, float UAS = 0.0, float LS = 0.0, int wordCount = 0):
        """
        Another constructor of the parser evaluation score object.
        :param LAS: Label attachment score
        :param UAS: Unlabelled attachment score
        :param LS: Label score
        :param wordCount: Number of words evaluated
        """
        self.LAS = LAS
        self.UAS = UAS
        self.LS = LS
        self.word_count = wordCount

    cpdef float getLS(self):
        """
        Accessor for the LS field
        :return: Label score
        """
        return self.LS

    cpdef float getLAS(self):
        """
        Accessor for the LAS field
        :return: Label attachment score
        """
        return self.LAS

    cpdef float getUAS(self):
        """
        Accessor for the UAS field
        :return: Unlabelled attachment score
        """
        return self.UAS

    cpdef int getWordCount(self):
        """
        Accessor for the word count field
        :return: Number of words evaluated
        """
        return self.word_count

    cpdef add(self, ParserEvaluationScore parserEvaluationScore):
        """
        Adds a parser evaluation score to the current evaluation score.
        :param parserEvaluationScore: Parser evaluation score to be added.
        """
        self.LAS = (self.LAS * self.word_count + parserEvaluationScore.LAS * parserEvaluationScore.word_count) / \
                   (self.word_count + parserEvaluationScore.word_count)
        self.UAS = (self.UAS * self.word_count + parserEvaluationScore.UAS * parserEvaluationScore.word_count) / \
                   (self.word_count + parserEvaluationScore.word_count)
        self.LS = (self.LS * self.word_count + parserEvaluationScore.LS * parserEvaluationScore.word_count) / \
                  (self.word_count + parserEvaluationScore.word_count)
        self.word_count += parserEvaluationScore.word_count
