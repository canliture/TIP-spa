package com.canliture.tipj.frontend;

import org.antlr.v4.runtime.BufferedTokenStream;
import org.antlr.v4.runtime.CharStreams;
import org.junit.Assert;
import org.junit.Test;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.Objects;

/**
 * Created by liture on 2022/11/14 15:52
 */
public class ParserTest {

    @Test
    public void testStreamCode() throws IOException {
        String file = Objects.requireNonNull(getClass().getResource("/parser_test.tip")).getFile();
        TipLexer lexer = new TipLexer(CharStreams.fromStream(Files.newInputStream(Paths.get(file))));
        TipParser parser = new TipParser(new BufferedTokenStream(lexer));
        TipParser.ProgramContext progContext = parser.program();
        List<TipParser.FunContext> funcs = progContext.fun();
        Assert.assertEquals(11, funcs.size());
    }
}
