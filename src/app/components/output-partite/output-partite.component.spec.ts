import { ComponentFixture, TestBed } from '@angular/core/testing';

import { OutputPartiteComponent } from './output-partite.component';

describe('OutputPartiteComponent', () => {
  let component: OutputPartiteComponent;
  let fixture: ComponentFixture<OutputPartiteComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ OutputPartiteComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(OutputPartiteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
