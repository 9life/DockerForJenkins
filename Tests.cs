using NUnit.Framework;
using System;

namespace Tests
{
    [TestFixture]
    public class Tests
    {
        [Test]
        public void TestMethod1()
        {
            Console.WriteLine("TestMethod_1 is passed");
            Assert.Pass();
        }

        [Test]
        public void TestMethod2()
        {
            Console.WriteLine("TestMethod_2 is failed");
            Assert.Fail();
        }

        [Test]
        public void TestMethod3()
        {
            Console.WriteLine("TestMethod_3 is passed");
            Assert.Pass();
        }
    }
}

