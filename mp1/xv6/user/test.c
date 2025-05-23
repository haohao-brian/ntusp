#include "kernel/types.h"
#include "user/user.h"
#include "user/threads.h"

#define NULL 0

void task2(void *arg)
{
    int i = *(int *) arg;
    printf("task 2: %d\n", i);
    if (i % 4 == 3){
        thread_yield();
    }
}

void f2(void *arg)
{
    int i = 0;
    while(1) {
        printf("thread 2: %d\n",i++);
        if (i == 5) {
            thread_exit();
        }
        thread_yield();
    }
}

void f1(void *arg)
{
    int i = 100;

    struct thread *t2 = thread_create(f2, NULL);
    thread_add_runqueue(t2);

    while(1) {
        printf("thread 1: %d\n",i++);
        if (i == 106) {
            thread_exit();
        }else if (i & 1){
            thread_assign_task(t2, task2, &i);
            // thread_assign_task(t2, task2, &i);
            // thread_assign_task(t2, task2, &i);
            // thread_assign_task(t2, task2, &i);
        }
        thread_yield();
    }
}

int main(int argc, char **argv)
{
    printf("mp1-part2-0\n");
    struct thread *t1 = thread_create(f1, NULL);
    thread_add_runqueue(t1);
    thread_start_threading();
    printf("\nexited\n");
    exit(0);
}
