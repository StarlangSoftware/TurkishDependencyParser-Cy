from DependencyParser.Universal.UniversalDependencyPosType import UniversalDependencyPosType

cdef class UniversalDependencyTreeBankWord(Word):

    cpdef constructor1(self,
                     int id,
                     str lemma,
                     object upos,
                     str xpos,
                     UniversalDependencyTreeBankFeatures features,
                     UniversalDependencyRelation relation,
                     str deps,
                     str misc):
        """
        Constructor of the universal dependency word. Sets the attributes.
        :param id: Id of the word
        :param lemma: Lemma of the word
        :param upos: Universal part of speech tag.
        :param xpos: Extra part of speech tag
        :param features: Feature list of the word
        :param relation: Universal dependency relation of the word
        :param deps: External dependencies for the word
        :param misc: Miscellaneous information for the word.
        """
        self.id = id
        self.lemma = lemma
        self.u_pos = upos
        self.x_pos = xpos
        self.deps = deps
        self.features = features
        self.relation = relation
        self.misc = misc

    cpdef constructor2(self):
        """
        Default constructor for the universal dependency word. Sets the attributes to default values.
        """
        self.id = 0
        self.lemma = ""
        self.u_pos = UniversalDependencyPosType.X
        self.x_pos = ""
        self.features = None
        self.deps = ""
        self.misc = ""
        self.relation = UniversalDependencyRelation()

    def __init__(self,
                 id: int = None,
                 name: str = None,
                 lemma: str = None,
                 upos: UniversalDependencyPosType = None,
                 xpos: str = None,
                 features: UniversalDependencyTreeBankFeatures = None,
                 relation: UniversalDependencyRelation = None,
                 deps: str = None,
                 misc: str = None):
        if id is not None:
            super().__init__(name)
            self.constructor1(id,
                              lemma,
                              upos,
                              xpos,
                              features,
                              relation,
                              deps,
                              misc)
        else:
            super().__init__("root")
            self.constructor2()

    cpdef int getId(self):
        """
        Accessor for the id attribute.
        :return: Id attribute
        """
        return self.id

    cpdef str getLemma(self):
        """
        Accessor for the lemma attribute.
        :return: Lemma attribute
        """
        return self.lemma

    cpdef object getUpos(self):
        """
        Accessor for the upos attribute.
        :return: Upos attribute
        """
        return self.u_pos

    cpdef str getXPos(self):
        """
        Accessor for the xpos attribute.
        :return: Xpos attribute
        """
        return self.x_pos

    cpdef UniversalDependencyTreeBankFeatures getFeatures(self):
        """
        Accessor for the features attribute.
        :return: Features attribute
        """
        return self.features

    cpdef str getFeatureValue(self, str featureName):
        """
        Gets the value of a given feature.
        :param featureName: Name of the feature
        :return: Value of the feature
        """
        return self.features.getFeatureValue(featureName)

    cpdef bint featureExists(self, str featureName):
        """
        Checks if the given feature exists.
        :param featureName: Name of the feature
        :return: True if the given feature exists, False otherwise
        """
        return self.features.featureExists(featureName)

    cpdef UniversalDependencyRelation getRelation(self):
        """
        Accessor for the relation attribute.
        :return: Relation attribute
        """
        return self.relation

    cpdef setRelation(self, UniversalDependencyRelation relation):
        """
        Mytator for the relation attribute.
        :param relation: New relation attribute
        """
        self.relation = relation

    cpdef str getDeps(self):
        """
        Accessor for the deps attribute.
        :return: Deps attribute
        """
        return self.deps

    cpdef str getMisc(self):
        """
        Accessor for the misc attribute.
        :return: Misc attribute
        """
        return self.misc

    def __str__(self) -> str:
        return self.id.__str__() + "\t" + self.name + "\t" + self.lemma + "\t" + self.u_pos.__str__() + "\t" + \
               self.x_pos + "\t" + self.features.__str__() + "\t" + self.relation.to().__str__() + "\t" + \
               self.relation.__str__().lower() + "\t" + self.deps + "\t" + self.misc
