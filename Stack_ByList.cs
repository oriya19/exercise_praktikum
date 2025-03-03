using DataStructures;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    public class Stack_ByList
    {
        SinglyLinkedList list = new SinglyLinkedList();
        public void Push(int val)
        {
            list.PushFront(val);
        }
        public int Top()
        {
            return list.TopFront();
        }
        public int Pop()
        {
            int head = Top();
            list.PopFront();
            return tmp;
        }
        public bool IsEmpty()
        {
            return list.Empty();
        }
    }
}
