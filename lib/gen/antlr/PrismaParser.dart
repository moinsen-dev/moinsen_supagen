// Generated from Prisma.g4 by ANTLR 4.13.1
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';

import 'PrismaListener.dart';
import 'PrismaBaseListener.dart';
import 'PrismaVisitor.dart';
import 'PrismaBaseVisitor.dart';
const int RULE_prismaFile = 0, RULE_dataSource = 1, RULE_generator = 2, 
          RULE_model = 3, RULE_modelField = 4, RULE_fieldType = 5, RULE_baseType = 6, 
          RULE_arrayType = 7, RULE_modelType = 8, RULE_directives = 9, RULE_directive = 10, 
          RULE_modelAnnotation = 11, RULE_directiveArguments = 12, RULE_directiveArgument = 13, 
          RULE_value = 14, RULE_array = 15, RULE_enumDef = 16, RULE_enumValue = 17, 
          RULE_setting = 18, RULE_function = 19;
class PrismaParser extends Parser {
  static final checkVersion = () => RuntimeMetaData.checkVersion('4.13.1', RuntimeMetaData.VERSION);
  static const int TOKEN_EOF = IntStream.EOF;

  static final List<DFA> _decisionToDFA = List.generate(
      _ATN.numberOfDecisions, (i) => DFA(_ATN.getDecisionState(i), i));
  static final PredictionContextCache _sharedContextCache = PredictionContextCache();
  static const int TOKEN_DATASOURCE = 1, TOKEN_GENERATOR = 2, TOKEN_MODEL = 3, 
                   TOKEN_ENUM = 4, TOKEN_INT = 5, TOKEN_STRING = 6, TOKEN_BOOLEAN = 7, 
                   TOKEN_DATETIME = 8, TOKEN_FIELD_DIRECTIVE = 9, TOKEN_MODEL_DIRECTIVE = 10, 
                   TOKEN_LBRACE = 11, TOKEN_RBRACE = 12, TOKEN_LBRACKET = 13, 
                   TOKEN_RBRACKET = 14, TOKEN_LPAREN = 15, TOKEN_RPAREN = 16, 
                   TOKEN_COMMA = 17, TOKEN_EQUALS = 18, TOKEN_COLON = 19, 
                   TOKEN_SEMICOLON = 20, TOKEN_QUESTION_MARK = 21, TOKEN_BOOLEAN_LITERAL = 22, 
                   TOKEN_IDENT = 23, TOKEN_STRING_LITERAL = 24, TOKEN_NUMBER = 25, 
                   TOKEN_WS = 26, TOKEN_LINE_COMMENT = 27, TOKEN_COMMENT = 28;

  @override
  final List<String> ruleNames = [
    'prismaFile', 'dataSource', 'generator', 'model', 'modelField', 'fieldType', 
    'baseType', 'arrayType', 'modelType', 'directives', 'directive', 'modelAnnotation', 
    'directiveArguments', 'directiveArgument', 'value', 'array', 'enumDef', 
    'enumValue', 'setting', 'function'
  ];

  static final List<String?> _LITERAL_NAMES = [
      null, "'datasource'", "'generator'", "'model'", "'enum'", "'Int'", 
      "'String'", "'Boolean'", "'DateTime'", "'@'", "'@@'", "'{'", "'}'", 
      "'['", "']'", "'('", "')'", "','", "'='", "':'", "';'", "'?'"
  ];
  static final List<String?> _SYMBOLIC_NAMES = [
      null, "DATASOURCE", "GENERATOR", "MODEL", "ENUM", "INT", "STRING", 
      "BOOLEAN", "DATETIME", "FIELD_DIRECTIVE", "MODEL_DIRECTIVE", "LBRACE", 
      "RBRACE", "LBRACKET", "RBRACKET", "LPAREN", "RPAREN", "COMMA", "EQUALS", 
      "COLON", "SEMICOLON", "QUESTION_MARK", "BOOLEAN_LITERAL", "IDENT", 
      "STRING_LITERAL", "NUMBER", "WS", "LINE_COMMENT", "COMMENT"
  ];
  static final Vocabulary VOCABULARY = VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

  @override
  Vocabulary get vocabulary {
    return VOCABULARY;
  }

  @override
  String get grammarFileName => 'Prisma.g4';

  @override
  List<int> get serializedATN => _serializedATN;

  @override
  ATN getATN() {
   return _ATN;
  }

  PrismaParser(TokenStream input) : super(input) {
    interpreter = ParserATNSimulator(this, _ATN, _decisionToDFA, _sharedContextCache);
  }

  PrismaFileContext prismaFile() {
    dynamic _localctx = PrismaFileContext(context, state);
    enterRule(_localctx, 0, RULE_prismaFile);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 48;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 402653214) != 0)) {
        state = 46;
        errorHandler.sync(this);
        switch (tokenStream.LA(1)!) {
        case TOKEN_COMMENT:
          state = 40;
          match(TOKEN_COMMENT);
          break;
        case TOKEN_LINE_COMMENT:
          state = 41;
          match(TOKEN_LINE_COMMENT);
          break;
        case TOKEN_DATASOURCE:
          state = 42;
          dataSource();
          break;
        case TOKEN_GENERATOR:
          state = 43;
          generator();
          break;
        case TOKEN_MODEL:
          state = 44;
          model();
          break;
        case TOKEN_ENUM:
          state = 45;
          enumDef();
          break;
        default:
          throw NoViableAltException(this);
        }
        state = 50;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 51;
      match(TOKEN_EOF);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  DataSourceContext dataSource() {
    dynamic _localctx = DataSourceContext(context, state);
    enterRule(_localctx, 2, RULE_dataSource);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 53;
      match(TOKEN_DATASOURCE);
      state = 54;
      match(TOKEN_IDENT);
      state = 55;
      match(TOKEN_LBRACE);
      state = 59;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_IDENT) {
        state = 56;
        setting();
        state = 61;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 62;
      match(TOKEN_RBRACE);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  GeneratorContext generator() {
    dynamic _localctx = GeneratorContext(context, state);
    enterRule(_localctx, 4, RULE_generator);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 64;
      match(TOKEN_GENERATOR);
      state = 65;
      match(TOKEN_IDENT);
      state = 66;
      match(TOKEN_LBRACE);
      state = 70;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_IDENT) {
        state = 67;
        setting();
        state = 72;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 73;
      match(TOKEN_RBRACE);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ModelContext model() {
    dynamic _localctx = ModelContext(context, state);
    enterRule(_localctx, 6, RULE_model);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 75;
      match(TOKEN_MODEL);
      state = 76;
      match(TOKEN_IDENT);
      state = 77;
      match(TOKEN_LBRACE);
      state = 82;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_MODEL_DIRECTIVE || _la == TOKEN_IDENT) {
        state = 80;
        errorHandler.sync(this);
        switch (tokenStream.LA(1)!) {
        case TOKEN_IDENT:
          state = 78;
          modelField();
          break;
        case TOKEN_MODEL_DIRECTIVE:
          state = 79;
          modelAnnotation();
          break;
        default:
          throw NoViableAltException(this);
        }
        state = 84;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 85;
      match(TOKEN_RBRACE);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ModelFieldContext modelField() {
    dynamic _localctx = ModelFieldContext(context, state);
    enterRule(_localctx, 8, RULE_modelField);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 87;
      match(TOKEN_IDENT);
      state = 88;
      fieldType();
      state = 90;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (_la == TOKEN_QUESTION_MARK) {
        state = 89;
        match(TOKEN_QUESTION_MARK);
      }

      state = 93;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (_la == TOKEN_FIELD_DIRECTIVE) {
        state = 92;
        directives();
      }

      state = 96;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (_la == TOKEN_SEMICOLON) {
        state = 95;
        match(TOKEN_SEMICOLON);
      }

    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  FieldTypeContext fieldType() {
    dynamic _localctx = FieldTypeContext(context, state);
    enterRule(_localctx, 10, RULE_fieldType);
    try {
      state = 102;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 9, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 98;
        baseType();
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 99;
        arrayType();
        break;
      case 3:
        enterOuterAlt(_localctx, 3);
        state = 100;
        function();
        break;
      case 4:
        enterOuterAlt(_localctx, 4);
        state = 101;
        modelType();
        break;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  BaseTypeContext baseType() {
    dynamic _localctx = BaseTypeContext(context, state);
    enterRule(_localctx, 12, RULE_baseType);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 104;
      _la = tokenStream.LA(1)!;
      if (!((((_la) & ~0x3f) == 0 && ((1 << _la) & 480) != 0))) {
      errorHandler.recoverInline(this);
      } else {
        if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
        errorHandler.reportMatch(this);
        consume();
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ArrayTypeContext arrayType() {
    dynamic _localctx = ArrayTypeContext(context, state);
    enterRule(_localctx, 14, RULE_arrayType);
    try {
      enterOuterAlt(_localctx, 1);
      state = 108;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_INT:
      case TOKEN_STRING:
      case TOKEN_BOOLEAN:
      case TOKEN_DATETIME:
        state = 106;
        baseType();
        break;
      case TOKEN_IDENT:
        state = 107;
        modelType();
        break;
      default:
        throw NoViableAltException(this);
      }
      state = 110;
      match(TOKEN_LBRACKET);
      state = 111;
      match(TOKEN_RBRACKET);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ModelTypeContext modelType() {
    dynamic _localctx = ModelTypeContext(context, state);
    enterRule(_localctx, 16, RULE_modelType);
    try {
      enterOuterAlt(_localctx, 1);
      state = 113;
      match(TOKEN_IDENT);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  DirectivesContext directives() {
    dynamic _localctx = DirectivesContext(context, state);
    enterRule(_localctx, 18, RULE_directives);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 115;
      directive();
      state = 119;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_FIELD_DIRECTIVE) {
        state = 116;
        directive();
        state = 121;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  DirectiveContext directive() {
    dynamic _localctx = DirectiveContext(context, state);
    enterRule(_localctx, 20, RULE_directive);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 122;
      match(TOKEN_FIELD_DIRECTIVE);
      state = 123;
      match(TOKEN_IDENT);
      state = 125;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (_la == TOKEN_LPAREN) {
        state = 124;
        directiveArguments();
      }

    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ModelAnnotationContext modelAnnotation() {
    dynamic _localctx = ModelAnnotationContext(context, state);
    enterRule(_localctx, 22, RULE_modelAnnotation);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 127;
      match(TOKEN_MODEL_DIRECTIVE);
      state = 128;
      match(TOKEN_IDENT);
      state = 130;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (_la == TOKEN_LPAREN) {
        state = 129;
        directiveArguments();
      }

      state = 133;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (_la == TOKEN_SEMICOLON) {
        state = 132;
        match(TOKEN_SEMICOLON);
      }

    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  DirectiveArgumentsContext directiveArguments() {
    dynamic _localctx = DirectiveArgumentsContext(context, state);
    enterRule(_localctx, 24, RULE_directiveArguments);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 135;
      match(TOKEN_LPAREN);
      state = 136;
      directiveArgument();
      state = 141;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_COMMA) {
        state = 137;
        match(TOKEN_COMMA);
        state = 138;
        directiveArgument();
        state = 143;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 144;
      match(TOKEN_RPAREN);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  DirectiveArgumentContext directiveArgument() {
    dynamic _localctx = DirectiveArgumentContext(context, state);
    enterRule(_localctx, 26, RULE_directiveArgument);
    try {
      state = 151;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 16, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 146;
        match(TOKEN_IDENT);
        state = 147;
        match(TOKEN_COLON);
        state = 148;
        value();
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 149;
        value();
        break;
      case 3:
        enterOuterAlt(_localctx, 3);
        state = 150;
        function();
        break;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ValueContext value() {
    dynamic _localctx = ValueContext(context, state);
    enterRule(_localctx, 28, RULE_value);
    try {
      state = 159;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 17, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 153;
        match(TOKEN_STRING_LITERAL);
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 154;
        match(TOKEN_NUMBER);
        break;
      case 3:
        enterOuterAlt(_localctx, 3);
        state = 155;
        match(TOKEN_BOOLEAN_LITERAL);
        break;
      case 4:
        enterOuterAlt(_localctx, 4);
        state = 156;
        array();
        break;
      case 5:
        enterOuterAlt(_localctx, 5);
        state = 157;
        function();
        break;
      case 6:
        enterOuterAlt(_localctx, 6);
        state = 158;
        match(TOKEN_IDENT);
        break;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ArrayContext array() {
    dynamic _localctx = ArrayContext(context, state);
    enterRule(_localctx, 30, RULE_array);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 161;
      match(TOKEN_LBRACKET);
      state = 162;
      value();
      state = 167;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_COMMA) {
        state = 163;
        match(TOKEN_COMMA);
        state = 164;
        value();
        state = 169;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 170;
      match(TOKEN_RBRACKET);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  EnumDefContext enumDef() {
    dynamic _localctx = EnumDefContext(context, state);
    enterRule(_localctx, 32, RULE_enumDef);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 172;
      match(TOKEN_ENUM);
      state = 173;
      match(TOKEN_IDENT);
      state = 174;
      match(TOKEN_LBRACE);
      state = 178;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_IDENT) {
        state = 175;
        enumValue();
        state = 180;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 181;
      match(TOKEN_RBRACE);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  EnumValueContext enumValue() {
    dynamic _localctx = EnumValueContext(context, state);
    enterRule(_localctx, 34, RULE_enumValue);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 183;
      match(TOKEN_IDENT);
      state = 185;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (_la == TOKEN_SEMICOLON) {
        state = 184;
        match(TOKEN_SEMICOLON);
      }

    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  SettingContext setting() {
    dynamic _localctx = SettingContext(context, state);
    enterRule(_localctx, 36, RULE_setting);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 187;
      match(TOKEN_IDENT);
      state = 188;
      match(TOKEN_EQUALS);
      state = 192;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 21, context)) {
      case 1:
        state = 189;
        function();
        break;
      case 2:
        state = 190;
        match(TOKEN_STRING_LITERAL);
        break;
      case 3:
        state = 191;
        match(TOKEN_IDENT);
        break;
      }
      state = 195;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (_la == TOKEN_SEMICOLON) {
        state = 194;
        match(TOKEN_SEMICOLON);
      }

    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  FunctionContext function() {
    dynamic _localctx = FunctionContext(context, state);
    enterRule(_localctx, 38, RULE_function);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 197;
      match(TOKEN_IDENT);
      state = 198;
      match(TOKEN_LPAREN);
      state = 207;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if ((((_la) & ~0x3f) == 0 && ((1 << _la) & 62922752) != 0)) {
        state = 199;
        value();
        state = 204;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_COMMA) {
          state = 200;
          match(TOKEN_COMMA);
          state = 201;
          value();
          state = 206;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
      }

      state = 209;
      match(TOKEN_RPAREN);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  static const List<int> _serializedATN = [
      4,1,28,212,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,6,
      2,7,7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,2,13,7,13,2,
      14,7,14,2,15,7,15,2,16,7,16,2,17,7,17,2,18,7,18,2,19,7,19,1,0,1,0,
      1,0,1,0,1,0,1,0,5,0,47,8,0,10,0,12,0,50,9,0,1,0,1,0,1,1,1,1,1,1,1,
      1,5,1,58,8,1,10,1,12,1,61,9,1,1,1,1,1,1,2,1,2,1,2,1,2,5,2,69,8,2,10,
      2,12,2,72,9,2,1,2,1,2,1,3,1,3,1,3,1,3,1,3,5,3,81,8,3,10,3,12,3,84,
      9,3,1,3,1,3,1,4,1,4,1,4,3,4,91,8,4,1,4,3,4,94,8,4,1,4,3,4,97,8,4,1,
      5,1,5,1,5,1,5,3,5,103,8,5,1,6,1,6,1,7,1,7,3,7,109,8,7,1,7,1,7,1,7,
      1,8,1,8,1,9,1,9,5,9,118,8,9,10,9,12,9,121,9,9,1,10,1,10,1,10,3,10,
      126,8,10,1,11,1,11,1,11,3,11,131,8,11,1,11,3,11,134,8,11,1,12,1,12,
      1,12,1,12,5,12,140,8,12,10,12,12,12,143,9,12,1,12,1,12,1,13,1,13,1,
      13,1,13,1,13,3,13,152,8,13,1,14,1,14,1,14,1,14,1,14,1,14,3,14,160,
      8,14,1,15,1,15,1,15,1,15,5,15,166,8,15,10,15,12,15,169,9,15,1,15,1,
      15,1,16,1,16,1,16,1,16,5,16,177,8,16,10,16,12,16,180,9,16,1,16,1,16,
      1,17,1,17,3,17,186,8,17,1,18,1,18,1,18,1,18,1,18,3,18,193,8,18,1,18,
      3,18,196,8,18,1,19,1,19,1,19,1,19,1,19,5,19,203,8,19,10,19,12,19,206,
      9,19,3,19,208,8,19,1,19,1,19,1,19,0,0,20,0,2,4,6,8,10,12,14,16,18,
      20,22,24,26,28,30,32,34,36,38,0,1,1,0,5,8,228,0,48,1,0,0,0,2,53,1,
      0,0,0,4,64,1,0,0,0,6,75,1,0,0,0,8,87,1,0,0,0,10,102,1,0,0,0,12,104,
      1,0,0,0,14,108,1,0,0,0,16,113,1,0,0,0,18,115,1,0,0,0,20,122,1,0,0,
      0,22,127,1,0,0,0,24,135,1,0,0,0,26,151,1,0,0,0,28,159,1,0,0,0,30,161,
      1,0,0,0,32,172,1,0,0,0,34,183,1,0,0,0,36,187,1,0,0,0,38,197,1,0,0,
      0,40,47,5,28,0,0,41,47,5,27,0,0,42,47,3,2,1,0,43,47,3,4,2,0,44,47,
      3,6,3,0,45,47,3,32,16,0,46,40,1,0,0,0,46,41,1,0,0,0,46,42,1,0,0,0,
      46,43,1,0,0,0,46,44,1,0,0,0,46,45,1,0,0,0,47,50,1,0,0,0,48,46,1,0,
      0,0,48,49,1,0,0,0,49,51,1,0,0,0,50,48,1,0,0,0,51,52,5,0,0,1,52,1,1,
      0,0,0,53,54,5,1,0,0,54,55,5,23,0,0,55,59,5,11,0,0,56,58,3,36,18,0,
      57,56,1,0,0,0,58,61,1,0,0,0,59,57,1,0,0,0,59,60,1,0,0,0,60,62,1,0,
      0,0,61,59,1,0,0,0,62,63,5,12,0,0,63,3,1,0,0,0,64,65,5,2,0,0,65,66,
      5,23,0,0,66,70,5,11,0,0,67,69,3,36,18,0,68,67,1,0,0,0,69,72,1,0,0,
      0,70,68,1,0,0,0,70,71,1,0,0,0,71,73,1,0,0,0,72,70,1,0,0,0,73,74,5,
      12,0,0,74,5,1,0,0,0,75,76,5,3,0,0,76,77,5,23,0,0,77,82,5,11,0,0,78,
      81,3,8,4,0,79,81,3,22,11,0,80,78,1,0,0,0,80,79,1,0,0,0,81,84,1,0,0,
      0,82,80,1,0,0,0,82,83,1,0,0,0,83,85,1,0,0,0,84,82,1,0,0,0,85,86,5,
      12,0,0,86,7,1,0,0,0,87,88,5,23,0,0,88,90,3,10,5,0,89,91,5,21,0,0,90,
      89,1,0,0,0,90,91,1,0,0,0,91,93,1,0,0,0,92,94,3,18,9,0,93,92,1,0,0,
      0,93,94,1,0,0,0,94,96,1,0,0,0,95,97,5,20,0,0,96,95,1,0,0,0,96,97,1,
      0,0,0,97,9,1,0,0,0,98,103,3,12,6,0,99,103,3,14,7,0,100,103,3,38,19,
      0,101,103,3,16,8,0,102,98,1,0,0,0,102,99,1,0,0,0,102,100,1,0,0,0,102,
      101,1,0,0,0,103,11,1,0,0,0,104,105,7,0,0,0,105,13,1,0,0,0,106,109,
      3,12,6,0,107,109,3,16,8,0,108,106,1,0,0,0,108,107,1,0,0,0,109,110,
      1,0,0,0,110,111,5,13,0,0,111,112,5,14,0,0,112,15,1,0,0,0,113,114,5,
      23,0,0,114,17,1,0,0,0,115,119,3,20,10,0,116,118,3,20,10,0,117,116,
      1,0,0,0,118,121,1,0,0,0,119,117,1,0,0,0,119,120,1,0,0,0,120,19,1,0,
      0,0,121,119,1,0,0,0,122,123,5,9,0,0,123,125,5,23,0,0,124,126,3,24,
      12,0,125,124,1,0,0,0,125,126,1,0,0,0,126,21,1,0,0,0,127,128,5,10,0,
      0,128,130,5,23,0,0,129,131,3,24,12,0,130,129,1,0,0,0,130,131,1,0,0,
      0,131,133,1,0,0,0,132,134,5,20,0,0,133,132,1,0,0,0,133,134,1,0,0,0,
      134,23,1,0,0,0,135,136,5,15,0,0,136,141,3,26,13,0,137,138,5,17,0,0,
      138,140,3,26,13,0,139,137,1,0,0,0,140,143,1,0,0,0,141,139,1,0,0,0,
      141,142,1,0,0,0,142,144,1,0,0,0,143,141,1,0,0,0,144,145,5,16,0,0,145,
      25,1,0,0,0,146,147,5,23,0,0,147,148,5,19,0,0,148,152,3,28,14,0,149,
      152,3,28,14,0,150,152,3,38,19,0,151,146,1,0,0,0,151,149,1,0,0,0,151,
      150,1,0,0,0,152,27,1,0,0,0,153,160,5,24,0,0,154,160,5,25,0,0,155,160,
      5,22,0,0,156,160,3,30,15,0,157,160,3,38,19,0,158,160,5,23,0,0,159,
      153,1,0,0,0,159,154,1,0,0,0,159,155,1,0,0,0,159,156,1,0,0,0,159,157,
      1,0,0,0,159,158,1,0,0,0,160,29,1,0,0,0,161,162,5,13,0,0,162,167,3,
      28,14,0,163,164,5,17,0,0,164,166,3,28,14,0,165,163,1,0,0,0,166,169,
      1,0,0,0,167,165,1,0,0,0,167,168,1,0,0,0,168,170,1,0,0,0,169,167,1,
      0,0,0,170,171,5,14,0,0,171,31,1,0,0,0,172,173,5,4,0,0,173,174,5,23,
      0,0,174,178,5,11,0,0,175,177,3,34,17,0,176,175,1,0,0,0,177,180,1,0,
      0,0,178,176,1,0,0,0,178,179,1,0,0,0,179,181,1,0,0,0,180,178,1,0,0,
      0,181,182,5,12,0,0,182,33,1,0,0,0,183,185,5,23,0,0,184,186,5,20,0,
      0,185,184,1,0,0,0,185,186,1,0,0,0,186,35,1,0,0,0,187,188,5,23,0,0,
      188,192,5,18,0,0,189,193,3,38,19,0,190,193,5,24,0,0,191,193,5,23,0,
      0,192,189,1,0,0,0,192,190,1,0,0,0,192,191,1,0,0,0,193,195,1,0,0,0,
      194,196,5,20,0,0,195,194,1,0,0,0,195,196,1,0,0,0,196,37,1,0,0,0,197,
      198,5,23,0,0,198,207,5,15,0,0,199,204,3,28,14,0,200,201,5,17,0,0,201,
      203,3,28,14,0,202,200,1,0,0,0,203,206,1,0,0,0,204,202,1,0,0,0,204,
      205,1,0,0,0,205,208,1,0,0,0,206,204,1,0,0,0,207,199,1,0,0,0,207,208,
      1,0,0,0,208,209,1,0,0,0,209,210,5,16,0,0,210,39,1,0,0,0,25,46,48,59,
      70,80,82,90,93,96,102,108,119,125,130,133,141,151,159,167,178,185,
      192,195,204,207
  ];

  static final ATN _ATN =
      ATNDeserializer().deserialize(_serializedATN);
}
class PrismaFileContext extends ParserRuleContext {
  TerminalNode? EOF() => getToken(PrismaParser.TOKEN_EOF, 0);
  List<TerminalNode> COMMENTs() => getTokens(PrismaParser.TOKEN_COMMENT);
  TerminalNode? COMMENT(int i) => getToken(PrismaParser.TOKEN_COMMENT, i);
  List<TerminalNode> LINE_COMMENTs() => getTokens(PrismaParser.TOKEN_LINE_COMMENT);
  TerminalNode? LINE_COMMENT(int i) => getToken(PrismaParser.TOKEN_LINE_COMMENT, i);
  List<DataSourceContext> dataSources() => getRuleContexts<DataSourceContext>();
  DataSourceContext? dataSource(int i) => getRuleContext<DataSourceContext>(i);
  List<GeneratorContext> generators() => getRuleContexts<GeneratorContext>();
  GeneratorContext? generator(int i) => getRuleContext<GeneratorContext>(i);
  List<ModelContext> models() => getRuleContexts<ModelContext>();
  ModelContext? model(int i) => getRuleContext<ModelContext>(i);
  List<EnumDefContext> enumDefs() => getRuleContexts<EnumDefContext>();
  EnumDefContext? enumDef(int i) => getRuleContext<EnumDefContext>(i);
  PrismaFileContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_prismaFile;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.enterPrismaFile(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.exitPrismaFile(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is PrismaVisitor<T>) {
     return visitor.visitPrismaFile(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class DataSourceContext extends ParserRuleContext {
  TerminalNode? DATASOURCE() => getToken(PrismaParser.TOKEN_DATASOURCE, 0);
  TerminalNode? IDENT() => getToken(PrismaParser.TOKEN_IDENT, 0);
  TerminalNode? LBRACE() => getToken(PrismaParser.TOKEN_LBRACE, 0);
  TerminalNode? RBRACE() => getToken(PrismaParser.TOKEN_RBRACE, 0);
  List<SettingContext> settings() => getRuleContexts<SettingContext>();
  SettingContext? setting(int i) => getRuleContext<SettingContext>(i);
  DataSourceContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_dataSource;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.enterDataSource(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.exitDataSource(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is PrismaVisitor<T>) {
     return visitor.visitDataSource(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class GeneratorContext extends ParserRuleContext {
  TerminalNode? GENERATOR() => getToken(PrismaParser.TOKEN_GENERATOR, 0);
  TerminalNode? IDENT() => getToken(PrismaParser.TOKEN_IDENT, 0);
  TerminalNode? LBRACE() => getToken(PrismaParser.TOKEN_LBRACE, 0);
  TerminalNode? RBRACE() => getToken(PrismaParser.TOKEN_RBRACE, 0);
  List<SettingContext> settings() => getRuleContexts<SettingContext>();
  SettingContext? setting(int i) => getRuleContext<SettingContext>(i);
  GeneratorContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_generator;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.enterGenerator(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.exitGenerator(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is PrismaVisitor<T>) {
     return visitor.visitGenerator(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class ModelContext extends ParserRuleContext {
  TerminalNode? MODEL() => getToken(PrismaParser.TOKEN_MODEL, 0);
  TerminalNode? IDENT() => getToken(PrismaParser.TOKEN_IDENT, 0);
  TerminalNode? LBRACE() => getToken(PrismaParser.TOKEN_LBRACE, 0);
  TerminalNode? RBRACE() => getToken(PrismaParser.TOKEN_RBRACE, 0);
  List<ModelFieldContext> modelFields() => getRuleContexts<ModelFieldContext>();
  ModelFieldContext? modelField(int i) => getRuleContext<ModelFieldContext>(i);
  List<ModelAnnotationContext> modelAnnotations() => getRuleContexts<ModelAnnotationContext>();
  ModelAnnotationContext? modelAnnotation(int i) => getRuleContext<ModelAnnotationContext>(i);
  ModelContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_model;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.enterModel(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.exitModel(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is PrismaVisitor<T>) {
     return visitor.visitModel(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class ModelFieldContext extends ParserRuleContext {
  TerminalNode? IDENT() => getToken(PrismaParser.TOKEN_IDENT, 0);
  FieldTypeContext? fieldType() => getRuleContext<FieldTypeContext>(0);
  TerminalNode? QUESTION_MARK() => getToken(PrismaParser.TOKEN_QUESTION_MARK, 0);
  DirectivesContext? directives() => getRuleContext<DirectivesContext>(0);
  TerminalNode? SEMICOLON() => getToken(PrismaParser.TOKEN_SEMICOLON, 0);
  ModelFieldContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_modelField;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.enterModelField(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.exitModelField(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is PrismaVisitor<T>) {
     return visitor.visitModelField(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class FieldTypeContext extends ParserRuleContext {
  BaseTypeContext? baseType() => getRuleContext<BaseTypeContext>(0);
  ArrayTypeContext? arrayType() => getRuleContext<ArrayTypeContext>(0);
  FunctionContext? function() => getRuleContext<FunctionContext>(0);
  ModelTypeContext? modelType() => getRuleContext<ModelTypeContext>(0);
  FieldTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_fieldType;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.enterFieldType(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.exitFieldType(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is PrismaVisitor<T>) {
     return visitor.visitFieldType(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class BaseTypeContext extends ParserRuleContext {
  TerminalNode? INT() => getToken(PrismaParser.TOKEN_INT, 0);
  TerminalNode? STRING() => getToken(PrismaParser.TOKEN_STRING, 0);
  TerminalNode? BOOLEAN() => getToken(PrismaParser.TOKEN_BOOLEAN, 0);
  TerminalNode? DATETIME() => getToken(PrismaParser.TOKEN_DATETIME, 0);
  BaseTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_baseType;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.enterBaseType(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.exitBaseType(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is PrismaVisitor<T>) {
     return visitor.visitBaseType(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class ArrayTypeContext extends ParserRuleContext {
  TerminalNode? LBRACKET() => getToken(PrismaParser.TOKEN_LBRACKET, 0);
  TerminalNode? RBRACKET() => getToken(PrismaParser.TOKEN_RBRACKET, 0);
  BaseTypeContext? baseType() => getRuleContext<BaseTypeContext>(0);
  ModelTypeContext? modelType() => getRuleContext<ModelTypeContext>(0);
  ArrayTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_arrayType;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.enterArrayType(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.exitArrayType(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is PrismaVisitor<T>) {
     return visitor.visitArrayType(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class ModelTypeContext extends ParserRuleContext {
  TerminalNode? IDENT() => getToken(PrismaParser.TOKEN_IDENT, 0);
  ModelTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_modelType;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.enterModelType(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.exitModelType(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is PrismaVisitor<T>) {
     return visitor.visitModelType(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class DirectivesContext extends ParserRuleContext {
  List<DirectiveContext> directives() => getRuleContexts<DirectiveContext>();
  DirectiveContext? directive(int i) => getRuleContext<DirectiveContext>(i);
  DirectivesContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_directives;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.enterDirectives(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.exitDirectives(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is PrismaVisitor<T>) {
     return visitor.visitDirectives(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class DirectiveContext extends ParserRuleContext {
  TerminalNode? FIELD_DIRECTIVE() => getToken(PrismaParser.TOKEN_FIELD_DIRECTIVE, 0);
  TerminalNode? IDENT() => getToken(PrismaParser.TOKEN_IDENT, 0);
  DirectiveArgumentsContext? directiveArguments() => getRuleContext<DirectiveArgumentsContext>(0);
  DirectiveContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_directive;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.enterDirective(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.exitDirective(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is PrismaVisitor<T>) {
     return visitor.visitDirective(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class ModelAnnotationContext extends ParserRuleContext {
  TerminalNode? MODEL_DIRECTIVE() => getToken(PrismaParser.TOKEN_MODEL_DIRECTIVE, 0);
  TerminalNode? IDENT() => getToken(PrismaParser.TOKEN_IDENT, 0);
  DirectiveArgumentsContext? directiveArguments() => getRuleContext<DirectiveArgumentsContext>(0);
  TerminalNode? SEMICOLON() => getToken(PrismaParser.TOKEN_SEMICOLON, 0);
  ModelAnnotationContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_modelAnnotation;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.enterModelAnnotation(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.exitModelAnnotation(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is PrismaVisitor<T>) {
     return visitor.visitModelAnnotation(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class DirectiveArgumentsContext extends ParserRuleContext {
  TerminalNode? LPAREN() => getToken(PrismaParser.TOKEN_LPAREN, 0);
  List<DirectiveArgumentContext> directiveArguments() => getRuleContexts<DirectiveArgumentContext>();
  DirectiveArgumentContext? directiveArgument(int i) => getRuleContext<DirectiveArgumentContext>(i);
  TerminalNode? RPAREN() => getToken(PrismaParser.TOKEN_RPAREN, 0);
  List<TerminalNode> COMMAs() => getTokens(PrismaParser.TOKEN_COMMA);
  TerminalNode? COMMA(int i) => getToken(PrismaParser.TOKEN_COMMA, i);
  DirectiveArgumentsContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_directiveArguments;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.enterDirectiveArguments(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.exitDirectiveArguments(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is PrismaVisitor<T>) {
     return visitor.visitDirectiveArguments(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class DirectiveArgumentContext extends ParserRuleContext {
  TerminalNode? IDENT() => getToken(PrismaParser.TOKEN_IDENT, 0);
  TerminalNode? COLON() => getToken(PrismaParser.TOKEN_COLON, 0);
  ValueContext? value() => getRuleContext<ValueContext>(0);
  FunctionContext? function() => getRuleContext<FunctionContext>(0);
  DirectiveArgumentContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_directiveArgument;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.enterDirectiveArgument(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.exitDirectiveArgument(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is PrismaVisitor<T>) {
     return visitor.visitDirectiveArgument(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class ValueContext extends ParserRuleContext {
  TerminalNode? STRING_LITERAL() => getToken(PrismaParser.TOKEN_STRING_LITERAL, 0);
  TerminalNode? NUMBER() => getToken(PrismaParser.TOKEN_NUMBER, 0);
  TerminalNode? BOOLEAN_LITERAL() => getToken(PrismaParser.TOKEN_BOOLEAN_LITERAL, 0);
  ArrayContext? array() => getRuleContext<ArrayContext>(0);
  FunctionContext? function() => getRuleContext<FunctionContext>(0);
  TerminalNode? IDENT() => getToken(PrismaParser.TOKEN_IDENT, 0);
  ValueContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_value;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.enterValue(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.exitValue(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is PrismaVisitor<T>) {
     return visitor.visitValue(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class ArrayContext extends ParserRuleContext {
  TerminalNode? LBRACKET() => getToken(PrismaParser.TOKEN_LBRACKET, 0);
  List<ValueContext> values() => getRuleContexts<ValueContext>();
  ValueContext? value(int i) => getRuleContext<ValueContext>(i);
  TerminalNode? RBRACKET() => getToken(PrismaParser.TOKEN_RBRACKET, 0);
  List<TerminalNode> COMMAs() => getTokens(PrismaParser.TOKEN_COMMA);
  TerminalNode? COMMA(int i) => getToken(PrismaParser.TOKEN_COMMA, i);
  ArrayContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_array;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.enterArray(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.exitArray(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is PrismaVisitor<T>) {
     return visitor.visitArray(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class EnumDefContext extends ParserRuleContext {
  TerminalNode? ENUM() => getToken(PrismaParser.TOKEN_ENUM, 0);
  TerminalNode? IDENT() => getToken(PrismaParser.TOKEN_IDENT, 0);
  TerminalNode? LBRACE() => getToken(PrismaParser.TOKEN_LBRACE, 0);
  TerminalNode? RBRACE() => getToken(PrismaParser.TOKEN_RBRACE, 0);
  List<EnumValueContext> enumValues() => getRuleContexts<EnumValueContext>();
  EnumValueContext? enumValue(int i) => getRuleContext<EnumValueContext>(i);
  EnumDefContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_enumDef;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.enterEnumDef(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.exitEnumDef(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is PrismaVisitor<T>) {
     return visitor.visitEnumDef(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class EnumValueContext extends ParserRuleContext {
  TerminalNode? IDENT() => getToken(PrismaParser.TOKEN_IDENT, 0);
  TerminalNode? SEMICOLON() => getToken(PrismaParser.TOKEN_SEMICOLON, 0);
  EnumValueContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_enumValue;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.enterEnumValue(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.exitEnumValue(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is PrismaVisitor<T>) {
     return visitor.visitEnumValue(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class SettingContext extends ParserRuleContext {
  List<TerminalNode> IDENTs() => getTokens(PrismaParser.TOKEN_IDENT);
  TerminalNode? IDENT(int i) => getToken(PrismaParser.TOKEN_IDENT, i);
  TerminalNode? EQUALS() => getToken(PrismaParser.TOKEN_EQUALS, 0);
  FunctionContext? function() => getRuleContext<FunctionContext>(0);
  TerminalNode? STRING_LITERAL() => getToken(PrismaParser.TOKEN_STRING_LITERAL, 0);
  TerminalNode? SEMICOLON() => getToken(PrismaParser.TOKEN_SEMICOLON, 0);
  SettingContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_setting;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.enterSetting(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.exitSetting(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is PrismaVisitor<T>) {
     return visitor.visitSetting(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class FunctionContext extends ParserRuleContext {
  TerminalNode? IDENT() => getToken(PrismaParser.TOKEN_IDENT, 0);
  TerminalNode? LPAREN() => getToken(PrismaParser.TOKEN_LPAREN, 0);
  TerminalNode? RPAREN() => getToken(PrismaParser.TOKEN_RPAREN, 0);
  List<ValueContext> values() => getRuleContexts<ValueContext>();
  ValueContext? value(int i) => getRuleContext<ValueContext>(i);
  List<TerminalNode> COMMAs() => getTokens(PrismaParser.TOKEN_COMMA);
  TerminalNode? COMMA(int i) => getToken(PrismaParser.TOKEN_COMMA, i);
  FunctionContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_function;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.enterFunction(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is PrismaListener) listener.exitFunction(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is PrismaVisitor<T>) {
     return visitor.visitFunction(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

