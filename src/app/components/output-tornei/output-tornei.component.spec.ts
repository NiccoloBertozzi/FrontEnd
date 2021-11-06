import { ComponentFixture, TestBed } from '@angular/core/testing';

import { OutputTorneiComponent } from './output-tornei.component';

describe('OutputTorneiComponent', () => {
  let component: OutputTorneiComponent;
  let fixture: ComponentFixture<OutputTorneiComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ OutputTorneiComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(OutputTorneiComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
