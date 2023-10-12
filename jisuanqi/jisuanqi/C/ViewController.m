#import "ViewController.h"

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<stdbool.h>
#include<math.h>

@interface ViewController ()

@property (nonatomic, strong) View *aView;
@property (nonatomic, strong) Model *model;

@end

static int pointNum = 0;
static int kuoHaoNum = 0;
static int fuHaoNum = 0;
static int jianHao = 0;
static int numAKuoHao = 1;
static int inKuoHao = 0;
static int dengYu = 0;
static int point = 1;
static int dengYuNum = 0;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.aView = [[View alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.aView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pressNum:) name:@"NumGo" object:nil];

    self.model = [[Model alloc] init];
    [self.model addObserver:self forKeyPath:@"a" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    self.aView.label.text = [NSString stringWithFormat:@"%@",self.model.StrNum];
    self.aView.label.adjustsFontSizeToFitWidth = YES;
}

- (void)pressWanCheng {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)pressNum: (NSNotification*)sender{
    UIButton *Button = sender.userInfo[@"btn"];
    if(Button.tag == 0) {
        pointNum = 0;
        kuoHaoNum = 0;
        fuHaoNum = 0;
        jianHao = 0;
        numAKuoHao = 1;
        inKuoHao = 0;
        dengYu = 0;
        point = 1;
        dengYuNum = 0;
        
        NSUInteger a = [self.model.StrNum length];
        [self.model.StrNum deleteCharactersInRange:NSMakeRange(0, a)];
    }
    if (Button.tag == 1) {
        if(numAKuoHao) {
            [self.model.StrNum appendFormat:@"("];
            pointNum = 0;
            kuoHaoNum++;
            fuHaoNum = 0;
            jianHao = 1;
            numAKuoHao = 1;
            inKuoHao = 0;
            dengYu = 0;
            point = 1;
            dengYuNum++;
        } else {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"输入格式错误" preferredStyle:UIAlertControllerStyleAlert];
            [self presentViewController:alert animated:YES completion:nil];
            [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(pressWanCheng) userInfo:nil repeats:NO];
        }
    }
    if (Button.tag == 2) {
        if(fuHaoNum && inKuoHao && kuoHaoNum != 0) {
            [self.model.StrNum appendFormat:@")"];
            pointNum = 0;
            kuoHaoNum--;
            fuHaoNum = 1;
            jianHao = 1;
            numAKuoHao = 0;
            dengYu = 1;
            point = 1;
            dengYuNum++;
        } else {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"输入格式错误" preferredStyle:UIAlertControllerStyleAlert];
            [self presentViewController:alert animated:YES completion:nil];
            [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(pressWanCheng) userInfo:nil repeats:NO];
        }
    }
    if (Button.tag == 3) {
        if(fuHaoNum) {
            [self.model.StrNum appendFormat:@"/"];
            pointNum = 0;
            fuHaoNum = 0;
            jianHao = 1;
            numAKuoHao = 1;
            inKuoHao = 1;
            dengYu = 0;
            point = 1;
            dengYuNum++;
        } else {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"输入格式错误" preferredStyle:UIAlertControllerStyleAlert];
            [self presentViewController:alert animated:YES completion:nil];
            [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(pressWanCheng) userInfo:nil repeats:NO];
        }
    }
    if(Button.tag == 4) {
        [self.model.StrNum appendFormat:@"7"];
        pointNum = 1;
        fuHaoNum = 1;
        jianHao = 2;
        numAKuoHao = 0;
        dengYu = 1;
    }
    if(Button.tag == 5) {
        [self.model.StrNum appendFormat:@"8"];
        pointNum = 1;
        fuHaoNum = 1;
        jianHao = 2;
        numAKuoHao = 0;
        dengYu = 1;
    }
    if(Button.tag == 6) {
        [self.model.StrNum appendFormat:@"9"];
        pointNum = 1;
        fuHaoNum = 1;
        jianHao = 2;
        numAKuoHao = 0;
        dengYu = 1;
    }
    if (Button.tag == 7) {
        if(fuHaoNum) {
            [self.model.StrNum appendFormat:@"*"];
            pointNum = 0;
            fuHaoNum = 0;
            jianHao = 1;
            numAKuoHao = 1;
            inKuoHao = 1;
            dengYu = 0;
            point = 1;
            dengYuNum++;
        } else {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"输入格式错误" preferredStyle:UIAlertControllerStyleAlert];
            [self presentViewController:alert animated:YES completion:nil];
            [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(pressWanCheng) userInfo:nil repeats:NO];
        }
    }
    if(Button.tag == 8) {
        [self.model.StrNum appendFormat:@"4"];
        pointNum = 1;
        fuHaoNum = 1;
        jianHao = 2;
        numAKuoHao = 0;
        dengYu = 1;
    }
    if(Button.tag == 9) {
        [self.model.StrNum appendFormat:@"5"];
        pointNum = 1;
        fuHaoNum = 1;
        jianHao = 2;
        numAKuoHao = 0;
        dengYu = 1;
    }
    if(Button.tag == 10) {
        [self.model.StrNum appendFormat:@"6"];
        pointNum = 1;
        fuHaoNum = 1;
        jianHao = 2;
        numAKuoHao = 0;
        dengYu = 1;
    }
    if (Button.tag == 11) {
        if ([self.model.StrNum length] == 0) {
            [self.model.StrNum appendFormat:@"-"];
            pointNum = 0;
            fuHaoNum = 0;
            jianHao = 0;
            numAKuoHao = 1;
            dengYu = 0;
            point = 1;
        } else if(jianHao) {
            [self.model.StrNum appendFormat:@"-"];
            pointNum = 0;
            fuHaoNum = 0;
            jianHao--;
            numAKuoHao = 1;
            inKuoHao = 1;
            dengYu = 0;
            point = 1;
            dengYuNum++;
        } else {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"输入格式错误" preferredStyle:UIAlertControllerStyleAlert];
            [self presentViewController:alert animated:YES completion:nil];
            [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(pressWanCheng) userInfo:nil repeats:NO];
        }
    }
    if(Button.tag == 12) {
        [self.model.StrNum appendFormat:@"1"];
        pointNum = 1;
        fuHaoNum = 1;
        jianHao = 2;
        numAKuoHao = 0;
        dengYu = 1;
    }
    if(Button.tag == 13) {
        [self.model.StrNum appendFormat:@"2"];
        pointNum = 1;
        fuHaoNum = 1;
        jianHao = 2;
        numAKuoHao = 0;
        dengYu = 1;
    }
    if(Button.tag == 14) {
        [self.model.StrNum appendFormat:@"3"];
        pointNum = 1;
        fuHaoNum = 1;
        jianHao = 2;
        numAKuoHao = 0;
        dengYu = 1;
    }
    if (Button.tag == 15) {
        if(fuHaoNum) {
            [self.model.StrNum appendFormat:@"+"];
            pointNum = 0;
            fuHaoNum = 0;
            jianHao = 1;
            numAKuoHao = 1;
            inKuoHao = 1;
            dengYu = 0;
            point = 1;
            dengYuNum++;
        } else {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"输入格式错误" preferredStyle:UIAlertControllerStyleAlert];
            [self presentViewController:alert animated:YES completion:nil];
            [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(pressWanCheng) userInfo:nil repeats:NO];
        }
    }
    if(Button.tag == 16) {
        [self.model.StrNum appendFormat:@"0"];
        pointNum = 1;
        fuHaoNum = 1;
        jianHao = 2;
        numAKuoHao = 0;
        dengYu = 1;
    }
    if (Button.tag == 17) {
        if(point && fuHaoNum && pointNum) {
            [self.model.StrNum appendFormat:@"."];
            pointNum = 0;
            fuHaoNum = 0;
            jianHao = 0;
            numAKuoHao = 0;
            dengYu = 0;
            point = 0;
        } else {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"输入格式错误" preferredStyle:UIAlertControllerStyleAlert];
            [self presentViewController:alert animated:YES completion:nil];
            [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(pressWanCheng) userInfo:nil repeats:NO];
        }
    }
    if (Button.tag == 19) {
        if(dengYuNum && kuoHaoNum == 0 && dengYu) {
            [self.model.StrNum appendFormat:@"="];
            NSLog(@"%@", self.model.StrNum);
            double b = [self jiSuan:self.model.StrNum];
            NSUInteger a = [self.model.StrNum length];
            [self.model.StrNum deleteCharactersInRange:NSMakeRange(0, a)];
            [self.model.StrNum appendFormat:@"%.9g", b];
            if ([self.model.StrNum isEqual: @"inf"]) {
                NSUInteger a = [self.model.StrNum length];
                [self.model.StrNum deleteCharactersInRange:NSMakeRange(0, a)];
                [self.model.StrNum appendFormat:@"不能除以0"];
            }
        } else {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"输入格式错误" preferredStyle:UIAlertControllerStyleAlert];
            [self presentViewController:alert animated:YES completion:nil];
            [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(pressWanCheng) userInfo:nil repeats:NO];
        }
    }
    self.model.a++;
}

static int n = 0;
typedef struct result {
    char stack[10000];
    int top;
    char nBoLan[10000];
}Result;

Result* CreatStack(void) {
    Result *stack = (Result*)malloc(sizeof(Result));
    stack->top = -1;
    return stack;
}

void PushStack(Result *obj, char val) {
    obj->stack[++obj->top] = val;
}

void PopStack(Result *obj) {
    if (obj->top >= 0) {
        obj->top--;
    }
}

char GetTopStack(Result *obj) {
    if (obj->top >= 0) {
        return obj->stack[obj->top];
    }
    return 0;
}

void caoZuoStack(char a, Result *obj) {
    if (a == '+' || a == '-') {
        if (obj->stack[obj->top] == '-') {
            while(obj->stack[obj->top] != '(' && obj->top >= 0) {
                obj->nBoLan[n++] = GetTopStack(obj);
                PopStack(obj);
            }
            PushStack(obj, a);
            obj->nBoLan[n++] = ',';
        } else if (obj->stack[obj->top] == '(') {
            PushStack(obj, a);
            obj->nBoLan[n++] = ',';
        } else if (obj->stack[obj->top] == '*' || obj->stack[obj->top] == '/') {
            while (obj->stack[obj->top] != '(' && obj->top >= 0) {
                obj->nBoLan[n++] = GetTopStack(obj);
                PopStack(obj);
            }
            PushStack(obj, a);
            obj->nBoLan[n++] = ',';
        } else {
            PushStack(obj, a);
            obj->nBoLan[n++] = ',';
        }
    } else if (a == '*' || a == '/'){
        if (obj->stack[obj->top] == '/') {
            obj->nBoLan[n++] = GetTopStack(obj);
            PopStack(obj);
            PushStack(obj, a);
            obj->nBoLan[n++] = ',';
        } else if (obj->stack[obj->top] == '(') {
            PushStack(obj, a);
            obj->nBoLan[n++] = ',';
        } else {
            PushStack(obj, a);
            obj->nBoLan[n++] = ',';
        }
    } else if (a == ')') {
        while(obj->stack[obj->top] != '(') {
            obj->nBoLan[n++] = GetTopStack(obj);
            PopStack(obj);
        }
        PopStack(obj);
    } else if (a == '(') {
        PushStack(obj, a);
    } else if (a != '=' && a != ')' && a != '(') {
        obj->nBoLan[n++] = a;
    }
    if (a == '=') {
        while(obj->top >= 0) {
            obj->nBoLan[n++] = GetTopStack(obj);
            PopStack(obj);
        }
    }
    printf("%s\n", obj->nBoLan);
}

double evalRPN(char *tokens, int tokensSize){
    int top = -1;
    double stack[100];
    for (int i = 0; i < tokensSize; i++) {
        if (tokens[i] == ',' || tokens[i] == '(' || tokens[i] == ')') {
            continue;
        }
        if (tokens[i] == '+') {
            stack[top - 1] = stack[top] + stack[top - 1];
            top--;
            continue;
        }
        if (tokens[i] == '-') {
            stack[top - 1] = stack[top - 1] - stack[top];
            top--;
            continue;
        }
        if (tokens[i] == '*') {
            stack[top - 1] = stack[top] * stack[top - 1];
            top--;
            continue;
        }
        if (tokens[i] == '/') {
            stack[top - 1] = stack[top - 1] / stack[top];
            top--;
            continue;
        } else {
            int sum = 0;
            char *s = (char*)malloc(sizeof(char) * 2 * (sum+1));
            while (tokens[i] != ',' && tokens[i] != '+' && tokens[i] != '-' && tokens[i] != '*' && tokens[i] != '/' && tokens[i] != '(' && tokens[i] != ')') {
                s[sum++] = tokens[i];
                i++;
            }
            if (tokens[i] == '+' || tokens[i] == '-' || tokens[i] == '*' || tokens[i] == '/' || tokens[i] == '(' || tokens[i] == ')') {
                i--;
            }
            char *t;
            double theNum = strtod(s, &t);
            stack[++top] = theNum;
        }
        continue;
    }
    return stack[top];
}

- (double)jiSuan: (NSString*)putInStr {
    NSLog(@"%@", putInStr);
    n = 0;
    Result *obj = CreatStack();
    for (int i = 0; i < [putInStr length]; i++) {
        if ((i == 0 && [putInStr characterAtIndex:0] == '-') || ([putInStr characterAtIndex:i] == '-' && ([putInStr characterAtIndex:i-1] == '+' || [putInStr characterAtIndex:i-1] == '-' || [putInStr characterAtIndex:i-1] == '*' || [putInStr characterAtIndex:i-1] == '/' || [putInStr characterAtIndex:i-1] == '('))) {
            caoZuoStack('(', obj);
            caoZuoStack('0', obj);
            caoZuoStack('-', obj);
            i++;
            while (([putInStr characterAtIndex:i] >= 48 && [putInStr characterAtIndex:i] <= 57) || [putInStr characterAtIndex:i] == '.') {
                caoZuoStack([putInStr characterAtIndex:i], obj);
                i++;
            }
            caoZuoStack(')', obj);
            i--;
            continue;
        }
        caoZuoStack([putInStr characterAtIndex:i], obj);
    }
    int tokensSize = (int)strlen(obj->nBoLan);
    printf("%lf", evalRPN(obj->nBoLan, tokensSize));
    return evalRPN(obj->nBoLan, tokensSize);
}

    
@end
